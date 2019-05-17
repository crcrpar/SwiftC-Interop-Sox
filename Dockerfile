FROM swift:5.0.1-bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
        aria2 \
        build-essential \
        cmake \
        git \
        wget \
        libopencore-amrnb-dev \
        libopencore-amrwb-dev \
        libao-dev libflac-dev \
        libmp3lame-dev \
        libtwolame-dev \
        libltdl-dev \
        libmad0-dev \
        libid3tag0-dev \
        libvorbis-dev \
        libpng-dev \
        libsndfile1-dev \
        libwavpack-dev \
        libsox-dev \
        autoconf \
        automake \
    && rm -rf /var/list/apt/lists/*

WORKDIR /workspace
