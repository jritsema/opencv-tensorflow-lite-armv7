FROM python:3.7-slim

RUN apt-get -y update && \
    apt-get -y install curl python3-opencv

RUN curl -sfLO https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl && \
    pip install tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl \
    imutils

RUN apt-get clean && \
    rm tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHONPATH /usr/lib/python3/dist-packages

CMD ["/bin/bash"]
