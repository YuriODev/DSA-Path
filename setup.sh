#!/bin/bash

# Create essential directories
mkdir -p notebooks scripts images

# Create a basic README.md with a project overview
cat << 'EOF' > README.md
# DSA-Path

Overview of the project:
- This project is aimed at learning Data Structures & Algorithms.
- It includes daily Jupyter notebooks, automation scripts, and visualizations.
EOF

# Create the LICENSE file with the MIT License text (update [Your Name] and year as needed)
cat << 'EOF' > LICENSE
MIT License

Copyright (c) $(date +%Y) [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy \
of this software and associated documentation files (the "Software"), to deal \
in the Software without restriction, including without limitation the rights \
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell \
copies of the Software, and to permit persons to whom the Software is \
furnished to do so, subject to the following conditions:

[... include the full MIT License text ...]
EOF

# Create a .gitignore file pre-configured for Python projects
cat << 'EOF' > .gitignore
# Byte-compiled / optimized files
__pycache__/
*.py[cod]
*$py.class

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
lib/
lib64/
parts/
sdist/
var/
*.egg-info/
.installed.cfg
*.egg

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Virtual environments
env/
.venv/

# Unit test / coverage reports
htmlcov/
.tox/
.nox/

# PyInstaller
*.manifest
*.spec

# mypy
.mypy_cache/
EOF

# Create CONTRIBUTING.md with basic guidelines
cat << 'EOF' > CONTRIBUTING.md
# Contributing Guidelines

Thank you for considering contributing to DSA-Path!

## How to Contribute
- Fork the repository
- Make your changes in a new branch
- Submit a pull request with a clear description of your changes

Please adhere to the coding conventions and write tests where applicable.
EOF

# Initialize a new git repository and make the first commit
git init
git add .
git commit -m "Initial commit: Set up repository structure with README, LICENSE, .gitignore, and CONTRIBUTING.md" 