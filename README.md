# cloady-xray

Minimal Xray-core (VLESS + WebSocket) container for PaaS deployment.
Official Xray binary is downloaded from the XTLS/Xray-core GitHub
release at image build time. Configuration is generated at container
start from environment variables:

- UUID (required): VLESS client UUID
- WS_PATH: WebSocket path, default /stream
- PORT: listen port, default 8080

TLS is terminated by the hosting platform's HTTPS gateway; the
container serves plain WebSocket behind it.
