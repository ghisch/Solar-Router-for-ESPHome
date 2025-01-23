#!/bin/bash
cat $1 | grep -v "url:.*" | sed "s/file: /<<: \!include / " | sed "s/  name: .*/  name: solarrouter/" | sed "s/  friendly_name: .*/  friendly_name: solarrouter/" | sed "s/    key: !secret .*/    key: !secret api_encryption_key/" | sed "s/    password: !secret .*/    password: !secret ota_password/" | grep -v "refresh:" > work_in_progress.yaml
