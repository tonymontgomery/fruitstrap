IOS_CC = xcrun -sdk iphoneos clang
IOS_MIN_OS = 5.1
IOS_SDK = 6.0
OSX_MIN = 10.7

CERT="iPhone Developer"

all: fruitstrap


fruitstrap: fruitstrap.c
	clang -o fruitstrap -mmacosx-version-min=$(OSX_MIN) -framework CoreFoundation -framework MobileDevice -F/System/Library/PrivateFrameworks fruitstrap.c

listdevices: listdevices.c
	gcc -g -o listdevices -framework CoreFoundation -framework MobileDevice -F/System/Library/PrivateFrameworks listdevices.c


install: fruitstrap
	sudo mkdir -p /usr/local/bin
	sudo cp fruitstrap /usr/local/bin/fruitstrap
