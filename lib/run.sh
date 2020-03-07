
if [ -f "{{pkg.svc_data_path}}/touchfile.txt" ]; then 
  d=$(date "+%F %H:%M:%S")
  echo "$d - Starting..." > "{{pkg.svc_data_path}}/touchfile.txt"
fi

while [ 1 ]
do
  if [ ! -d {{pkg.svc_data_path}} ]; then
    mkdir {{pkg.svc_data_path}}
  fi
  
  if [[ $(find "{{pkg.svc_data_path}}/touchfile.txt" -type f -size +4000c 2>/dev/null) ]]; then
    d=$(date "+%F %H:%M:%S")
    echo "$d - Clearing file..." > "{{pkg.svc_data_path}}/touchfile.txt"
  fi

  d=$(date "+%F %H:%M:%S")
  echo "$d - {{sys.hostname}} is running {{pkg.ident}}" >> "{{pkg.svc_data_path}}/touchfile.txt"

  sleep {{cfg.sleep_timer}}
done
