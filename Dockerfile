FROM jupyter/scipy-notebook:414b5d749704

USER root

RUN conda install --quiet --yes -c conda-forge \
    lifelines \
    jupytext \
    jupyter_contrib_nbextensions

RUN jupyter nbextension enable autoscroll/main --sys-prefix && \
    jupyter nbextension enable toc2/main --sys-prefix && \
    jupyter nbextension enable skip-traceback/main --sys-prefix && \
    jupyter nbextension enable execute_time/ExecuteTime --sys-prefix && \
    jupyter nbextension enable collapsible_headings/main --sys-prefix

RUN pip install \
    pyforest \
    bamboolib
    
RUN jupyter nbextension install --py pyforest --sys-prefix && \
    jupyter nbextension enable --py pyforest --sys-prefix && \
    jupyter nbextension enable --py qgrid --sys-prefix && \
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    jupyter nbextension install --py bamboolib --sys-prefix && \
    jupyter nbextension enable --py bamboolib --sys-prefix

# the fix permissions scripts don't seem to work properly these files
USER root
COPY user_imports.py /home/$NB_USER/.pyforest/user_imports.py
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
