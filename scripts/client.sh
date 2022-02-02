#!/usr/bin/env bash

# vagrant
# download tools
which curl wget unzip jq tar &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install --no-install-recommends -y curl wget unzip jq tar
}

P=vagrant
VERSION=$(curl -sL https://releases.hashicorp.com/${P}/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'ent|beta|rc|alpha' | tail -n1)

pushd /home/vagrant
wget https://releases.hashicorp.com/vagrant/${VERSION}/vagrant_${VERSION}_x86_64.deb
dpkg -i vagrant_${VERSION}_x86_64.deb

# cert.pem
curl -v --proxy http://192.168.56.10:8080 -o cert.pem http://mitm.it/cert/pem
chown vagrant: cert.pem

# proxy.env
cat > proxy.env <<EOF
export HTTPS_PROXY=http://192.168.56.10:8080
export HTTP_PROXY=http://192.168.56.10:8080
EOF
chown vagrant: proxy.env

# motd
chmod -x /etc/update-motd.d/*

cat > /etc/update-motd.d/99-proxy.sh <<EOF
#!/usr/bin/env bash
printf "Welcome to %s (%s %s %s)\n" "$DISTRIB_DESCRIPTION" "$(uname -o)" "$(uname -r)" "$(uname -m)"
cat <<EOF2

try

EOF2
EOF

chmod +x /etc/update-motd.d/99-proxy.sh

