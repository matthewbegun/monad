FROM jupyter/scipy-notebook:7a0c7325e470

USER $NB_USER

RUN conda install --quiet --yes -c conda-forge jupyter_contrib_nbextensions && \
    conda clean --all -f -y && \
    jupyter nbextension enable spellchecker/main --user && \
    jupyter nbextension enable skip-traceback/main --user && \
    jupyter nbextension enable execute_time/ExecuteTime --user && \
    jupyter nbextension enable collapsible_headings/main --user && \
    pip install pyforest==1.0.2 

USER root

RUN python -m pyforest install_extensions

USER $NB_USER

# The below code will make pyforest autoimport.
# However you still need to leave the first cell of the notebook as a code cell
# for the auto-imports.
# best just explicitly include this with formatting magic and so on at the top.
# RUN ipython -c "from pyforest.auto_import import setup; setup()"
