# GitHub Actions Runner – Pterodactyl Egg

This repository provides a **Pterodactyl egg** to deploy and manage a **self-hosted GitHub Actions Runner** inside a Pterodactyl environment.

The egg is designed to be used with a **community-maintained Docker image**, allowing secure and reproducible GitHub Actions execution without manual intervention.

---

## Features

- GitHub Actions Runner (Linux x64)
- Non-root execution
- Automatic runner registration
- Automatic startup (no manual commands required)
- Compatible with Pterodactyl Panel (PTDL v2)
- Designed for community and production environments

---

## Requirements

- Pterodactyl Panel (latest stable recommended)
- A GitHub repository or organization
- A valid GitHub **runner registration token**
- Outbound HTTPS access to GitHub

---

## Building the docker image

1. Clone this repository
2. Then run the following command
   ```
   sudo docker image build -f Dockerfile -t gh-worker:latest .
   ```

---

## Installation

### 1. Create a GitHub Runner Token

1. Go to your repository settings:
   ```
   https://github.com/<organization>/<repository>/settings/actions/runners/new
   ```
2. Copy the **Repository URL**
3. Generate and copy the **Registration Token**

---

### 2. Import the Egg into Pterodactyl

1. Open your **Pterodactyl Admin Panel**
2. Navigate to **Nests → Import Egg**
3. Import the provided `egg-git-hub-actions-runner.json`

---

### 3. Create the Server

When creating the server, set the following **Startup Variables**:

| Variable | Description |
|--------|------------|
| `REPO_URL` | GitHub repository URL |
| `REG_TOKEN` | GitHub registration token |

---

### 4. Start the Server

Once started:
- The runner is downloaded automatically
- The runner is registered automatically
- The runner starts automatically

No manual commands are required.

---

## License

MIT License
