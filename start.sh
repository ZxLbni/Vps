#!/bin/bash

# Start SSH
service ssh start

# Add your Ngrok Authtoken here (replace with your own)
NGROK_AUTH="2fJlzWTzFPY7XYwTbW9nNNu0n6d_41nFi3n6qRwt4VxnmfSXC"

if [ "$NGROK_AUTH" == "2fJlzWTzFPY7XYwTbW9nNNu0n6d_41nFi3n6qRwt4VxnmfSXC" ]; then
  echo "Please set your Ngrok Authtoken in start.sh"
  exit 1
fi

ngrok authtoken "$NGROK_AUTH"

# Start Ngrok and auto-restart on failure
while true; do
  echo "[INFO] Starting Ngrok tunnel..."
  ngrok tcp 22 > /tmp/ngrok.log &
  NGROK_PID=$!

  sleep 5
  curl -s http://localhost:4040/api/tunnels > /tmp/tunnel_info.json
  echo "[INFO] Tunnel Info:"
  cat /tmp/tunnel_info.json | grep -Eo 'tcp://[a-zA-Z0-9\.:]+'

  wait $NGROK_PID
  echo "[WARN] Ngrok tunnel exited. Restarting in 5s..."
  sleep 5
done
