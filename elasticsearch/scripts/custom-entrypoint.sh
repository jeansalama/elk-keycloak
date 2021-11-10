#!/bin/bash
set -e

# Files created by Elasticsearch should always be group writable too
umask 0002

# Borrowed from original entrypoint, you can just "import it" with `source /usr/local/bin/docker-entrypoint.sh`
run_as_other_user_if_needed() {
  if [[ "$(id -u)" == "0" ]]; then
    # If running as root, drop to specified UID and run command
    exec chroot --userspec=1000:0 / "${@}"
  else
    # Either we are running in Openshift with random uid and are a member of the root group
    # or with a custom --user
    exec "${@}"
  fi
}

(run_as_other_user_if_needed elasticsearch-keystore create)
(run_as_other_user_if_needed echo "${ELASTIC_OIDC_CLIENT_SECRET}" | elasticsearch-keystore add --stdin xpack.security.authc.realms.oidc.oidc-elastic.rp.client_secret -v)

# End with elasticsearch docker original entrypoint
/usr/local/bin/docker-entrypoint.sh
