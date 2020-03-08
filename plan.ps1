$pkg_name = 'dummy-service'
$pkg_version = '0.1.7'
$pkg_license = ('MIT License')
$pkg_description = "Provides a dummy service that just touches a file every few seconds for testing/demoing Habitat with"

function Invoke-Download {
  return 0
}
function Invoke-Unpack {
  return 0
}
function Invoke-Build {
  return 0
}

function Invoke-Install {
  New-Item -ItemType directory -Path "$pkg_prefix/lib/"
  Copy-Item -Path "$PLAN_CONTEXT/lib/*" -Destination "$pkg_prefix/lib" -Recurse
}

function Invoke-BuildService {
  $dir = "$pkg_prefix/hooks"
  if (!(Test-Path -Path $dir)) {
      New-Item -ItemType directory -Path $dir
  }
  Copy-Item -Path "$pkg_prefix/lib/run.ps1" -Destination  "$pkg_prefix/hooks/run"
}
