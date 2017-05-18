. $PSScriptRoot\..\notepadplusplus\update.ps1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32_p)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64_p)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

try {
  update
} catch {
  if ($_ -match 'Could not create SSL/TLS secure channel') { return 'Ignore' }
  else { throw $_ }
}
