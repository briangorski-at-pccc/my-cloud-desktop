#!/usr/bin/env bash
set -euo pipefail

sudo mkdir -p /activity
sudo touch /activity/activity.log
sudo chmod 0666 /activity/activity.log

echo "Cloud desktop activity monitor is ready."
echo "Mouse and keyboard use will reset the Codespaces idle timer."
exec tail --lines=0 --follow=name --retry /activity/activity.log
