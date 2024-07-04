FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

## Install develop tools for ubuntu
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
python3-dev python3-pip python3-setuptools git g++ wget make libprotobuf-dev protobuf-compiler libopencv-dev \
libgoogle-glog-dev libboost-all-dev libhdf5-dev libatlas-base-dev freeglut3-dev curl unzip ffmpeg


RUN python3 -m pip install wheel fvcore iopath

## Install all the requirements
#WORKDIR /app
#COPY requirements.txt ./
#RUN python3 -m pip install -r requirements.txt

################################################# 3. Setup source code here ################################################
WORKDIR /app/src
COPY ./ ./
RUN make all


