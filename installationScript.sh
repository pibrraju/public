#!/bin/sh
set -e
set -x

echo "Launching DAS installation setup script."

sudo wget https://raw.githubusercontent.com/pib-insurance/public/master/install-das-V3.sh -O /tmp/install-das.sh
sudo chmod +x /tmp/install-das.sh

# Fire-and-forget the das installer to circumvent Ambari operation deadlock
# We also make sure the script cleans up after itself

nohup sh -c '/tmp/install-das.sh && rm -f /tmp/install-das.sh' &

echo "Das installation launch succeeded."
exit 0