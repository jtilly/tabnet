FROM python:3.8-slim-buster@sha256:dc9c4de1bb38720f70af28e8071f324052725ba122878fbac784be9b03f41590
RUN apt update && apt install curl make git libopenblas-base -y
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
ENV SHELL /bin/bash -l

ENV POETRY_CACHE /work/.cache/poetry
ENV PIP_CACHE_DIR /work/.cache/pip
ENV JUPYTER_RUNTIME_DIR /work/.cache/jupyter/runtime
ENV JUPYTER_CONFIG_DIR /work/.cache/jupyter/config

RUN $HOME/.poetry/bin/poetry config settings.virtualenvs.path $POETRY_CACHE

ENV PATH /root/.poetry/bin:/bin:/usr/local/bin:/usr/bin

CMD ["bash", "-l"]
