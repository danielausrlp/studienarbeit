# Base Image
FROM jupyter/base-notebook:latest

# Root für Installationen
USER root

# 1) System Tools
RUN apt-get update && apt-get install -y \
    git build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 2) Mamba
RUN conda install -y -c conda-forge mamba

# 3) SoS + xeus-cling + notebook
RUN mamba install -y -c conda-forge \
    sos-notebook \
    xeus-cling \
    jupyterlab \
    sos \
    sos-python \
    sos-bash \
    jupyterlab-sos


# 4) SoS Kernel registrieren
RUN python3 -m sos_notebook.install

# 5) Arbeitsverzeichnis
RUN mkdir -p /home/jovyan/work && \
    chown -R jovyan:users /home/jovyan

# 6) Jupyter Server Config erzeugen
RUN jupyter notebook --generate-config

# 7) Auth komplett deaktivieren
RUN cat <<'EOF' > /home/jovyan/.jupyter/jupyter_notebook_config.py
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.open_browser = False
c.ServerApp.token = ''
c.ServerApp.password = ''
c.ServerApp.disable_check_xsrf = True
c.ServerApp.allow_origin = '*'
c.ServerApp.allow_remote_access = True
c.ServerApp.root_dir = '/home/jovyan/work'
EOF

RUN cat <<'EOF' > /home/jovyan/.jupyter/jupyter_server_config.py
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.open_browser = False
c.ServerApp.token = ''
c.ServerApp.password = ''
c.ServerApp.disable_check_xsrf = True
c.ServerApp.allow_origin = '*'
c.ServerApp.allow_remote_access = True
c.ServerApp.root_dir = '/home/jovyan/work'
EOF


RUN chown jovyan:users /home/jovyan/.jupyter/jupyter_notebook_config.py
RUN chown jovyan:users /home/jovyan/.jupyter/jupyter_server_config.py


# 8) Zurück zu jovyan
USER jovyan

ENV PYDEVD_DISABLE_FILE_VALIDATION=1

# Port
EXPOSE 8888

# 9) Server starten (OHNE Flags)
CMD ["jupyter", "lab", "--no-browser", "--allow-root"]

