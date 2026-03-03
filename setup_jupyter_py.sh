#!/usr/bin/env bash
set -e  # Bei Fehler abbrechen

sudo apt install -y python3 python3-pip

sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old || true

sudo pip3 install notebook

sudo pip install gdown

sudo pip3 install jupyterlab

jupyter notebook --generate-config

CONFIG="$HOME/.jupyter/jupyter_notebook_config.py"
grep -q "NotebookApp.ip" "$CONFIG" || cat << 'EOF' >> "$CONFIG"
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 7777
c.ServerApp.open_browser = False
c.ServerApp.password = ''
c.ServerApp.token = ''
EOF

mkdir gpioC || true
cd gpioC
rm -f pigpioC.ipynb || true
gdown --id 1K3ni3pH8SdlAA6C95JIeBm71NXTb8hKp -O pigpioC.ipynb


echo "Installation beendet. Um Jupyter Notebook zu starten: jupyter notebook"
