
echo "Stopping mosquitto container ..."
docker stop mqtt-inbound mqtt-outbound mqtt-internal

echo "Removing mosquitto container ..."
docker rm mqtt-inbound mqtt-internal mqtt-outbound

echo "Done!"