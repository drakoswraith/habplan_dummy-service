
if (test-path -path "{{pkg.svc_data_path}}/touchfile.txt") {
  $d = Get-Date -Format "yyyy/MM/dd HH:mm"
  "$d - Starting..." | Set-Content "{{pkg.svc_data_path}}/touchfile.txt"
}
$i = 0

while($true) {
  $i += 1

  if (!(test-path -path {{pkg.svc_data_path}})) {
    new-item -ItemType directory -path {{pkg.svc_data_path}}
  }
  
  if($i -gt 1000) {
    $i = 0
    $d = Get-Date -Format "yyyy/MM/dd HH:mm"
    "$d - Clearing file...." | Set-Content "{{pkg.svc_data_path}}/touchfile.txt"
  }

  $d = Get-Date -Format "yyyy/MM/dd HH:mm"
  $log_entry = "$d - {{sys.hostname}} is running {{pkg.ident}}"
  $log_entry | Add-Content "{{pkg.svc_data_path}}/touchfile.txt"
  start-sleep {{cfg.sleep_timer}}
}