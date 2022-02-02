#!/usr/bin/env bash

[ -f proxyssl-lab.zip ] && rm proxyssl-lab.zip
zip -r --exclude=proxyssl-lab/proxyssl-lab.sh --exclude=proxyssl-lab/.vagrant/* proxyssl-lab proxyssl-lab
