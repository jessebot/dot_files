# Files for building onboardme docker containers

```
├──  arm_config
│   ├──  default-onboardme-install.sh
│   ├──  devops-onboardme-install.sh
│   └──  music-onboardme-install.sh
├── ⚙️ config.conf
├── 🐳 Dockerfile
├── 🐳 Dockerfile.arm
└──  run_onboardme.sh
```

## Used in arm64 (aarch64) and amd64
`config.conf` is a special fastfetch config used for both docker images

## Only x86_64 (amd64)
- `Dockerfile` is for linux/amd64
- `run_onboardme.sh` is for running onboardme with package groups based on docker env vars

## Only ARM 64 (aarch64)
- `Dockerfile.arm` is for linux/arm64 and linux/aarch64
- `arm_config` is a directory of files just for arm builds to download binaries and compile from source if there's no package manager package.
