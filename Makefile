SOURCE="https://dl3.xmind.net/XMind-2020-for-Linux-x86-64bit-10.1.2-202004142327.rpm"
DESTINATION="build.rpm"
OUTPUT="XMind.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	rpm2cpio $(DESTINATION) | cpio -idmv

	rm -rf AppDir/application
	mkdir --parents AppDir/application
	cp -r ./opt/XMind/* ./AppDir/application
	
	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf usr
	rm -rf opt

