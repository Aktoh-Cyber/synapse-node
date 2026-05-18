# Synapse Node

> **Repository type**: build-artifact distribution. Source lives in [`synapse`](https://github.com/Aktoh-Cyber/synapse) under `synapse-node/`. This repo ships the Dockerfile and release smoke-test results only. Coverage is validated indirectly via `e2e/node-deployment.spec.ts` in the SOC dashboard and via `test-results/` produced on each release tag.

Deploy AI agent infrastructure on any device. Synapse Node connects to the Synapse control plane and provides local tool hosting, MCP server integration, and secure LibP2P tunneling.

## Quick Start

### Docker

```bash
docker run -d --name synapse-node \
  -e SYNAPSE_JOIN_TOKEN="<your-join-token>" \
  -e SYNAPSE_CONTROL_PLANE_URL="https://your-controlplane.example.com" \
  -p 8200:8200 \
  ghcr.io/aktoh-cyber/synapse-node:latest
```

### Binary

Download the latest release for your platform from the [Releases](https://github.com/Aktoh-Cyber/synapse-node/releases) page.

```bash
# Linux (amd64)
curl -fsSL https://github.com/Aktoh-Cyber/synapse-node/releases/latest/download/synapse-node-linux-amd64.tar.gz | tar xz
chmod +x synapse-node
./synapse-node --join-token "<your-token>" --control-plane-url "https://your-cp.example.com"

# macOS (Apple Silicon)
curl -fsSL https://github.com/Aktoh-Cyber/synapse-node/releases/latest/download/synapse-node-darwin-arm64.tar.gz | tar xz
chmod +x synapse-node
./synapse-node --join-token "<your-token>" --control-plane-url "https://your-cp.example.com"
```

## Configuration

| Flag / Env Var | Default | Description |
|----------------|---------|-------------|
| `--join-token` / `SYNAPSE_JOIN_TOKEN` | (required) | Join token from the control plane |
| `--control-plane-url` / `SYNAPSE_CONTROL_PLANE_URL` | `http://localhost:8080` | Control plane API URL |
| `--data-dir` | `./data/node` | Directory for keys, state, and tools |
| `--envhub-addr` | `/ip4/127.0.0.1/tcp/9100` | EnvHub LibP2P multiaddr |
| `--mcp-listen` | `127.0.0.1:8200` | MCP server listen address |
| `--max-tool-memory` | `256` | Max memory per tool execution (MB) |

## What It Does

- **Enrolls** with the Synapse control plane using a one-time join token
- **Establishes** a LibP2P tunnel to the EnvHub for secure communication
- **Hosts tools** locally via WebAssembly (WASM) sandboxed execution
- **Runs an MCP server** for local AI agent integration
- **Receives policy updates** and revocation notices from the control plane

## System Requirements

- Linux (amd64, arm64), macOS (amd64, arm64), or Windows (amd64)
- 64MB RAM minimum
- Network access to your control plane

## License

Proprietary — Horsemen Platform
