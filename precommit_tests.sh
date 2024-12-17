#!/bin/bash

if [ ! -d ".git/hooks" ]; then
  echo "Error: Git repository not initialized or .git/hooks directory does not exist."
  exit 1
fi

HOOK_PATH=".git/hooks/pre-commit"

cat <<EOT > $HOOK_PATH
#!/bin/bash
source .venv/bin/activate
pytest tests/
STATUS=\$?
if [ \$STATUS -ne 0 ]; then
    echo "Tests failed. Commit aborted."
    exit 1
else
    echo "All tests passed successfully!"
fi
exit 0
EOT

chmod +x $HOOK_PATH
echo "Pre-commit hook has been set up successfully! Pytest will run on commit."
