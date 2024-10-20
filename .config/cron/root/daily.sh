echo "apt upgrades start at:"
date
time apt-get update && time apt-get upgrade -y
echo "apt upgrades complete at:"
date
