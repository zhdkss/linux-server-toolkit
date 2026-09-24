# Contributing

1. Branch from `develop`: `feature/<name>`, `fix/<name>` or `docs/<name>`.
2. Keep commits small and meaningful. Use prefixes: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`.
3. Scripts must start with `#!/usr/bin/env bash` and `set -euo pipefail`, quote all variables,
   validate input and include a usage comment.
4. Test: `bash -n`, `shellcheck`, manual run (see README, Testing Process).
5. Open a PR into `develop` and fill in the template.
6. Reviewers check functionality, organization, documentation, potential problems,
   maintainability and security.
7. Address all comments, then merge after approval and delete the branch.
