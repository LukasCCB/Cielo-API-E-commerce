#requires -Version 5.1
<#
.SYNOPSIS
  Re-sincroniza o espelho local da documentacao da API E-commerce Cielo com a
  fonte oficial (docs.cielo.com.br).

.DESCRIPTION
  1. Baixa o indice do projeto (llms.txt) -> INDEX-llms.txt
  2. Extrai todas as URLs .md e re-baixa cada pagina em docs/, reference/ e
     changelog/, preservando a estrutura de pastas.
  3. Compara com o conteudo atual e reporta o que foi adicionado/alterado,
     destacando as novidades do changelog da fonte.

  Nao precisa de dependencias externas: usa apenas PowerShell (Invoke-WebRequest).

.EXAMPLE
  pwsh ./atualizar.ps1
  powershell -File .\atualizar.ps1
#>

[CmdletBinding()]
param(
    [int]$DelayMs = 400  # intervalo entre requisicoes, para evitar rate limit (HTTP 429)
)

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$ProjectIndex = 'https://docs.cielo.com.br/ecommerce-cielo/llms.txt'
$Base         = 'https://docs.cielo.com.br/ecommerce-cielo/'
$Root         = $PSScriptRoot
if (-not $Root) { $Root = (Get-Location).Path }

function Get-Url {
    param([string]$Url)
    # UTF-8 + sem cache. Retorna o texto da resposta.
    $r = Invoke-WebRequest -Uri $Url -UseBasicParsing -Headers @{ 'Cache-Control' = 'no-cache' }
    return [System.Text.Encoding]::UTF8.GetString($r.RawContentStream.ToArray())
}

Write-Host "==> Baixando indice do projeto..." -ForegroundColor Cyan
$index = Get-Url $ProjectIndex
Set-Content -Path (Join-Path $Root 'INDEX-llms.txt') -Value $index -Encoding utf8

# Extrai URLs .md unicas
$urls = [regex]::Matches($index, 'https://docs\.cielo\.com\.br/ecommerce-cielo/[^\s)]+?\.md') |
        ForEach-Object { $_.Value } | Sort-Object -Unique
Write-Host "==> $($urls.Count) paginas no indice." -ForegroundColor Cyan

$ok = 0; $fail = 0
$added = New-Object System.Collections.Generic.List[string]
$changed = New-Object System.Collections.Generic.List[string]
$failed = New-Object System.Collections.Generic.List[string]

foreach ($u in $urls) {
    $rel = $u.Substring($Base.Length)                       # ex.: docs/carne.md
    # Codifica cada segmento do caminho em UTF-8 (acentos -> %XX)
    $encRel = ($rel -split '/' | ForEach-Object { [uri]::EscapeDataString($_) }) -join '/'
    $encUrl = $Base + $encRel
    $dest = Join-Path $Root $rel
    $dir  = Split-Path $dest -Parent
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }

    $attempt = 0
    while ($true) {
        $attempt++
        try {
            $content = Get-Url $encUrl
            if (Test-Path $dest) {
                $old = Get-Content -Raw -Path $dest -ErrorAction SilentlyContinue
                if ($old -ne $content) { $changed.Add($rel) }
            } else {
                $added.Add($rel)
            }
            Set-Content -Path $dest -Value $content -Encoding utf8 -NoNewline
            $ok++
            break
        } catch {
            $code = $_.Exception.Response.StatusCode.value__ 2>$null
            if ($code -eq 429 -and $attempt -le 4) {
                $wait = 2 * $attempt
                Write-Host "    429 (rate limit) em $rel - aguardando ${wait}s..." -ForegroundColor DarkYellow
                Start-Sleep -Seconds $wait
                continue
            }
            Write-Host "    FALHA ($code) $rel" -ForegroundColor Red
            $failed.Add($rel); $fail++
            break
        }
    }
    Start-Sleep -Milliseconds $DelayMs
}

Write-Host ""
Write-Host "==================== RESUMO ====================" -ForegroundColor Green
Write-Host ("OK: {0}   Falhas: {1}   Novos: {2}   Alterados: {3}" -f $ok, $fail, $added.Count, $changed.Count)

$newChangelog = @($added) + @($changed) | Where-Object { $_ -like 'changelog/*' } | Sort-Object -Unique
if ($newChangelog.Count -gt 0) {
    Write-Host ""
    Write-Host "Novidades no changelog da fonte:" -ForegroundColor Yellow
    $newChangelog | ForEach-Object { Write-Host "  - $_" }
} else {
    Write-Host "Nenhuma novidade nova no changelog." -ForegroundColor DarkGray
}

if ($added.Count -gt 0)   { Write-Host "`nPaginas novas:" -ForegroundColor Yellow;   $added   | ForEach-Object { Write-Host "  + $_" } }
if ($changed.Count -gt 0) { Write-Host "`nPaginas alteradas:" -ForegroundColor Yellow; $changed | ForEach-Object { Write-Host "  ~ $_" } }
if ($failed.Count -gt 0)  { Write-Host "`nFalhas:" -ForegroundColor Red;              $failed  | ForEach-Object { Write-Host "  ! $_" } }

Write-Host ""
Write-Host ("Atualizado em {0}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm')) -ForegroundColor Green
