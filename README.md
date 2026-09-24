# Linux Server Toolkit

A collection of Bash scripts and documentation for Linux server administration.

## Project Purpose
The toolkit helps administrators perform routine server tasks quickly and safely:
viewing system information, monitoring disk usage and creating backups.
It also serves as an example of a professional Git workflow for a team project.

## Project Structure

~~~
linux-server-toolkit/
├── README.md                  # Project overview (this file)
├── CONTRIBUTING.md            # How to contribute
├── .gitignore                 # Files Git must not track (logs, backups, local config)
├── .gitattributes             # Forces LF line endings for scripts
├── .github/
│   └── pull_request_template.md
├── docs/
│   ├── installation.md        # Requirements and setup
│   ├── configuration.md       # Environment variables
│   └── troubleshooting.md     # Common problems and fixes
└── scripts/
    ├── system_info.sh         # Host, CPU, memory and disk overview
    ├── backup.sh              # Timestamped .tar.gz backups
    └── disk_monitor.sh        # Warns when disk usage exceeds a threshold
~~~

## Quick Start

~~~bash
git clone https://github.com/zhdkss/linux-server-toolkit.git
cd linux-server-toolkit
chmod +x scripts/*.sh
./scripts/system_info.sh
~~~

See [docs/installation.md](docs/installation.md) and [docs/configuration.md](docs/configuration.md).

## Development Workflow
1. Update `develop`: `git checkout develop && git pull`
2. Create a branch: `git checkout -b feature/<name>`
3. Make small, meaningful commits (Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`)
4. Push the branch and open a Pull Request into `develop`
5. At least one reviewer must approve before merging
6. Merge, then delete the branch
7. When `develop` is stable, it is merged into `main` as a release

## Branching Strategy

| Branch       | Purpose                                         |
|--------------|-------------------------------------------------|
| `main`       | Stable releases only. Protected, PR + approval  |
| `develop`    | Integration of finished features. Protected     |
| `feature/*`  | New functionality, created from `develop`       |
| `fix/*`      | Bug fixes and reverts, created from `develop`   |
| `docs/*`     | Documentation-only changes                      |

Direct pushes to `main` and `develop` are blocked by branch protection rules.

## Contribution Process
See [CONTRIBUTING.md](CONTRIBUTING.md). In short: branch from `develop`,
open a PR using the template (what / why / how tested), address review
comments, and merge only after approval.

## Testing Process
Every change to a script must pass before a PR is opened:
1. Syntax check: `bash -n scripts/<name>.sh`
2. Lint (if installed): `shellcheck scripts/<name>.sh`
3. Manual run with normal and edge-case input, for example:
   - `./scripts/backup.sh` (no argument, expects usage message)
   - `./scripts/backup.sh no_such_dir` (expects an error)
   - `DISK_THRESHOLD=50 ./scripts/disk_monitor.sh` (expects a warning)

## Troubleshooting Process
1. Check [docs/troubleshooting.md](docs/troubleshooting.md) for known problems
2. Reproduce the issue and run the script with `bash -x` to trace it
3. Find the change that caused it: `git log -p -- <file>`, `git blame <file>`
4. Fix it on a `fix/*` branch; if a commit is wrong, undo it with
   `git revert <hash>` (never `git reset` on shared branches)
