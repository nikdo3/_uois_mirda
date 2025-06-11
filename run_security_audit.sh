#!/bin/bash
echo "[+] Python závislosti – pip-audit a safety"
pip install pip-audit safety
pip-audit --output audit_python.json --format json
safety check --json > safety_python.json

echo "[+] Node.js závislosti – npm audit a snyk"
npm install
npm audit --json > audit_npm.json
npx snyk test --json > snyk_npm.json || true

echo "[+] Hotovo. Výstupy uloženy v JSON formátu."
