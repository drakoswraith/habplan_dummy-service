# dummy-service

This plan provides a service that does nothing to allow testing of Habitat work flows and processes

# Demo Update Strategies

Overview:

1. Set the HAB environment variables
  * HAB_BLDR_URL
  * HAB_ORIGIN
  * HAB_AUTO_TOKEN
2. Build the package, upload, and promote to a channel.
3. Increment the version, build, and upload, but do not promote
4. Run a habitat supervisor
5. Install the packge with an at-once strategy, and from the channel
6. Promote the newer version of the package to the channel
7. Check the touch file for updates


On build system (windows example):
```
hab pkg build
. ./results/last_build.ps1
hab pkg upload $pkg_artifact
hab pkg promote $pkg_ident uac x86_64-windows
```

On build system (windows example):
```
hab pkg build
. ./results/last_build.env
hab pkg upload $pkg_artifact
hab pkg promote $pkg_ident uac x86_64-linux
```

On test system, open two command prompts:

In first command prompt:
```
hab sup run --auto-update --strategy at-once
```


In second command prompt (windows):
```
hab svc load michaellehman/dummy-service --strategy at-once --channel uac
get-content c:\hab\svc\dummy-service\data\touchfile.txt -wait
```

In second command prompt (linux):
```
hab svc load michaellehman/dummy-service --strategy at-once --channel uac
tail -f /hab/svc/dummy-service/data/touchfile.txt
```