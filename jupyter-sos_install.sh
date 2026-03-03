#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# 1) Docker installieren
# -----------------------------------------------------------------------------
echo "📦 Docker Installation wird gestartet …"

# System aktualisieren
sudo apt update -y
sudo apt-get install -y curl

# Docker über offiziellen Script installieren
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Docker‑Service starten und aktivieren
sudo systemctl enable docker
sudo systemctl start docker

# aktuellen Benutzer zur "docker"-Gruppe hinzufügen (damit kein sudo nötig ist)
sudo usermod -aG docker $USER

echo "✅ Docker installiert. Du musst dich danach einmal ab‑ und wieder anmelden!"

# -----------------------------------------------------------------------------
# 2) Docker Image herunterladen
# -----------------------------------------------------------------------------
# Hier musst du das passende Image anpassen:
IMAGE_NAME="danielausrlp/jupyter-sos:latest"

echo "⬇️ Docker Image wird heruntergeladen: $IMAGE_NAME"
sudo docker pull "$IMAGE_NAME"

# -----------------------------------------------------------------------------
# 3) Aliase definieren
# -----------------------------------------------------------------------------
echo "🛠️ Shell Aliase werden eingerichtet …"

mkdir ~/sosNotebooks

ALIAS_FILE="$HOME/.docker_aliases"

cat << 'EOF' > "$ALIAS_FILE"
# 🐳 Docker jupyter-sos Aliase

# Container starten
alias sos_start="sudo docker run -d --name jupyter-sos -p 8888:8888 -v ~/sosNotebooks:/home/jovyan/work danielausrlp/jupyter-sos:latest"

# Container stoppen
alias sos_stop="sudo docker stop jupyter-sos && sudo docker rm jupyter-sos"

# Logs anzeigen
alias sos_logs="sudo docker logs -f jupyter-sos"

EOF

echo "source \"$ALIAS_FILE\"" >> "$HOME/.bashrc"
echo "✅ Aliase hinzugefügt! (start: sos_start | stop: sos_stop | logs: sos_logs)"

# -----------------------------------------------------------------------------
echo "✅ Fertig! Starte ein neues Terminal, damit Aliase aktiv werden."