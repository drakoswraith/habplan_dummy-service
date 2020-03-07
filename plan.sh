pkg_name=dummy-service
pkg_version=0.1.6
pkg_license=('Proprietary')
pkg_description="Provides a dummy service that just touches a file every few seconds for testing/demoing Habitat with"

do_download() {
  return 0
}
do_unpack() {
  return 0
}
do_build() {
  return 0
}

do_install() {
  mkdir $pkg_prefix/lib
  cp -R $PLAN_CONTEXT/lib/* $pkg_prefix/lib/
}

do_build_service() {
  mkdir -p $pkg_prefix/hooks
  cp $pkg_prefix/lib/run.sh $pkg_prefix/hooks/run
}
