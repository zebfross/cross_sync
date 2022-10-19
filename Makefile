build-win:
	${MAKE} -C ../go-syncthing build-win
	cp ..\go-syncthing\syncthing.a ./lib/src/syncthing/
	cp ..\go-syncthing\syncthing.h ./lib/src/syncthing/