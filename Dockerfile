FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \ 
    apt-get install -y curl build-essential git libffi-dev python-pip \
    lame flac vorbis-tools  # Codecs: support mp3, flac, ogg

WORKDIR /tmp

RUN curl  https://developer.spotify.com/download/libspotify/libspotify-12.1.51-Linux-x86_64-release.tar.gz -o libspot.tgz && \
    tar -xpzf libspot.tgz && \
    cd libspotify-12.1.51-Linux-x86_64-release && \
    make install prefix=/usr/local && \
    pip install spotify-ripper

# Cleanup
RUN apt-get remove -y  curl build-essential git libffi-dev && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# Set up local user to run as
RUN useradd -u 1001 -ms /bin/bash spotifyripper

USER spotifyripper
ENV HOME /home/spotifyripper
RUN mkdir /home/spotifyripper/music
WORKDIR /home/spotifyripper/music
VOLUME [/home/spotifyripper/.spotify-ripper, /home/spotifyripper/music]

ENTRYPOINT ["/usr/local/bin/spotify-ripper"]

