#!/bin/bash
cat $1 | grep -v "url:.*" | sed "s/file: /<<: \!include / " | grep -v "refresh:" > work_in_progress.yaml
