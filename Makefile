USER=wolfmanx

update: FORCE
	wget https://github.com/$(USER)/spotify-ripper/archive/master.tar.gz -O spotifyripper.tgz

FORCE:
