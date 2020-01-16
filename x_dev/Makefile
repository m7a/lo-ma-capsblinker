ma_capsblinker: ma_capsblinker.adb termination_status.adb termination_status.ads
	gnatmake -Wall -o ma_capsblinker ma_capsblinker.adb

#test: ma_capsblinker
#	./ma_capsblinker input5::capslock || true

clean:
	-rm *.ali *.o

dist-clean: clean
	-rm ma_capsblinker

install:
	[ -d "$(DESTDIR)/usr/bin" ] || mkdir -p "$(DESTDIR)/usr/bin"
	[ -d "$(DESTDIR)/lib/systemd/system" ] || \
					mkdir -p "$(DESTDIR)/lib/systemd/system"
	cp masysma-capsblinker.service "$(DESTDIR)/lib/systemd/system"
	install ma_capsblinker_shell "$(DESTDIR)/usr/bin"
	install ma_capsblinker "$(DESTDIR)/usr/bin"
