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
        autoconf \
        automake \
    && rm -rf /var/list/apt/lists/*

WORKDIR /workspace
RUN aria2c -x4 https://sourceforge.net/projects/sox/files/sox/14.4.2/sox-14.4.2.tar.gz && \
    tar xf sox-14.4.2.tar.gz && \
    rm sox-14.4.2.tar.gz
