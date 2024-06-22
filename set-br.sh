#!/bin/bash
GitUser="alkhanet26"
#wget https://github.com/${GitUser}/
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/${GitUser}/aws/main/rclone.conf"
apt install msmtp-mta ca-certificates bsd-mailx -y
cat <<'EOF'> /etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user orbi1.alkhanet@gmail.com
from orbi1.alkhanet@gmail.com
password Sukabumi123
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/${GitUser}/aws/main/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/${GitUser}/aws/main/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/${GitUser}/aws/main/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/aws/main/restore.sh"
wget -O strt "https://raw.githubusercontent.com/${GitUser}/aws/main/strt.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
cd
rm -f /root/set-br.sh
