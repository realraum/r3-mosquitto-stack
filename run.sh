##########################################################
## realraum mosquitto stack
## by verr && PeterTheOne
##########################################################


# location for logfiles (on host)
INTLOGS="/var/log/mqtt/internal"
OUTLOGS="/var/log/mqtt/outbound"
INLOGS="/var/log/mqtt/inbound"

mkdir -p $INTLOGS
mkdir -p $OUTLOGS
mkdir -p $INLOGS

WD=`pwd`

# internal broker
echo "Starting internal mosquitto ..."
docker run -d -p 1883:1883 -p 9001:9001 \
-v $WD/config-internal:/mqtt/config:ro \
-v $INTLOGS:/mqtt/log \
--name mqtt-internal toke/mosquitto

# outbound broker
echo "Starting outbound mosquitto ..."
docker run -d -p 1884:1883 -p 9002:9001 \
-v $WD/config-outbound:/mqtt/config:ro \
-v $OUTLOGS:/mqtt/log \
--name mqtt-outbound toke/mosquitto

# inbound broker (no exposed ports)
echo "Starting inbound mosquitto ..."
docker run -d \
-v $WD/config-inbound:/mqtt/config:ro \
-v $INLOGS:/mqtt/log \
--name mqtt-inbound toke/mosquitto

echo "Started 3x mosquitto! En-Garde!"
