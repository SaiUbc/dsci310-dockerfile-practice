# Use the specified r-notebook image as the base
FROM quay.io/jupyter/r-notebook:2023-11-19

# Optionally, you can add additional layers here, for example:
# Install additional R packages
USER root
RUN conda install --quiet --yes \
    'numpy=1.21.*' \
    'r-essentials=4.1.*' && \
    conda clean --all -f -y
# Switch back to the notebook user to avoid running as root
USER $NB_UID

# Additional custom setup can go here