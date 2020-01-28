FROM jupyter/scipy-notebook:7a0c7325e470

USER $NB_USER

RUN conda install --quiet --yes -c conda-forge \
    lifelines \
    pyreadstat \
    jupytext \
    jupyter_contrib_nbextensions && \
    jupyter nbextension enable autoscroll/main --user && \
    jupyter nbextension enable toc2/main --user && \
    jupyter nbextension enable skip-traceback/main --user && \
    jupyter nbextension enable execute_time/ExecuteTime --user && \
    jupyter nbextension enable collapsible_headings/main --user

RUN pip install --user pyforest \
    bamboolib && \
    jupyter nbextension install --py pyforest --user && \
    jupyter nbextension enable --py pyforest --user && \
    jupyter nbextension enable --py qgrid --user && \
    jupyter nbextension enable --py widgetsnbextension --user && \
    jupyter nbextension install --py bamboolib --user && \
    jupyter nbextension enable --py bamboolib --user

RUN fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

