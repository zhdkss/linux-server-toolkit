# Installation Guide

## Requirements
- Linux (Ubuntu 20.04+, Debian 11+, CentOS/Rocky 8+)
- Bash 4.0 or newer
- Git
- Optional: `shellcheck` for linting

## Steps
1. Clone the repository:

~~~bash
git clone https://github.com/zhdkss/linux-server-toolkit.git
cd linux-server-toolkit
~~~

2. Make scripts executable:

~~~bash
chmod +x scripts/*.sh
~~~

3. Run a script:

~~~bash
./scripts/system_info.sh
~~~

## Verifying the installation

~~~bash
bash -n scripts/*.sh   # syntax check, no output means OK
~~~
