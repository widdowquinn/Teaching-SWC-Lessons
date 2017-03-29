FROM andrewosh/binder-base

USER root

USER main

# Get rid of token/password requests
RUN mkdir -p $HOME/.jupyter
RUN echo "c.NotebookApp.token = ''" >> $HOME/.jupyter/jupyter_notebook_config.py

# Install requirements for Python 3
RUN /home/main/anaconda/envs/python3/bin/pip install -r requirements.txt
RUN /home/main/anaconda/envs/python3/bin/python -m ipykernel install --user --name Python3_swc --display-name "Python 3 (Teaching-SWC-Lessons)"