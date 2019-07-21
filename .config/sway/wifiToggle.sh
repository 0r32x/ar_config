if [ `systemctl is-active netctl-auto@wlp61s0.service` != "inactive" ]
then
    systemctl stop netctl-auto@wlp61s0.service
else
    systemctl start netctl-auto@wlp61s0.service
fi
