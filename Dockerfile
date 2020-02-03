FROM jupyter/scipy-notebook:7a0c7325e470

USER root

RUN conda install --quiet --yes -c conda-forge --overide-channel \
    lifelines \
    jupytext \
    jupyter_contrib_nbextensions && \
    jupyter nbextension enable autoscroll/main --sys-prefix && \
    jupyter nbextension enable toc2/main --sys-prefix && \
    jupyter nbextension enable skip-traceback/main --sys-prefix && \
    jupyter nbextension enable execute_time/ExecuteTime --sys-prefix && \
    jupyter nbextension enable collapsible_headings/main --sys-prefix

RUN pip install --user pyforest \
    bamboolib && \
    jupyter nbextension install --py pyforest --sys-prefix && \
    jupyter nbextension enable --py pyforest --sys-prefix && \
    jupyter nbextension enable --py qgrid --sys-prefix && \
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    jupyter nbextension install --py bamboolib --sys-prefix && \
    jupyter nbextension enable --py bamboolib --sys-prefix

RUN fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
