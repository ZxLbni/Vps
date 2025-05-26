# Root VPS with Ngrok Tunnel (Render 24/7)

Deploy a root-enabled SSH server using Ngrok TCP tunnel — runs 24/7 on Render.

## Features
- SSH root login via Ngrok tunnel
- Auto-restart Ngrok if disconnected
- Live public address logging
- 24/7 uptime via Render free tier

## Setup

1. Clone the repo
2. Replace `<YOUR_NGROK_AUTH_TOKEN>` in `start.sh`
3. Push to GitHub
4. Deploy via [Render](https://render.com)
   - Select Web Service
   - Use Dockerfile
   - Expose port: **22**

## Connect
Check the Render logs for:
```
tcp://x.tcp.ngrok.io:xxxxx
```
Then:
```bash
ssh root@x.tcp.ngrok.io -p xxxxx
# password: rootpass
```

## Notes
- Free Ngrok sessions last ~8 hours, this script auto-restarts
- For permanent tunnels, use Ngrok Pro with a reserved address
