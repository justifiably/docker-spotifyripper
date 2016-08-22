# spotify-ripper containerised in Docker.

See <https://github.com/jrnewell/spotify-ripper>.

Example invocation in docker:

    docker run -ti --rm=true -u=1001 -v ~/.spotify-ripper:/home/spotifyripper/.spotify-ripper -v `pwd`:/home/spotifyripper/music justifiably/spotifyripper  "$@"
