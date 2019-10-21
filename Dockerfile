FROM olegtarasov/miniconda3-forge

WORKDIR /usr/app

COPY environment.yml .

RUN conda env create -n sandbox -f environment.yml && \
    conda clean --all -y

COPY . .

CMD ["/bin/bash", "-l", "-c", "conda activate sandbox && env FLASK_APP=hello.py flask run --host=0.0.0.0"]