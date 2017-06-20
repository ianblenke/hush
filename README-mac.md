Command-line version
--------------------

This is a port of the radix42/zcash "zcash4mac" patches to zcash over to hush.

The User Guide for the command-line version of that is at:
https://github.com/radix42/zcash/wiki/Mac-User-Guide

Before hushd will start, you will need to create a `hush.conf` file:
```
mkdir -p ~/Library/"Application Support"/Hush
echo "rpcuser=username" >> "~/Library/"Application Support"/Hush/hush.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ~/Library/"Application Support"/Hush/hush.conf
```

Building from source
--------------------

First off you need Apple's Xcode (at least version 7, preferably 8.x) and the Xcode Command Line Tools:

https://itunes.apple.com/us/app/xcode/id497799835?mt=12

And Homebrew:

http://brew.sh/

And this is the list of brew packages you'll need installed:

```shell
brew tap discoteq/discoteq; brew install flock
brew install autoconf autogen automake
brew tap homebrew/versions; brew install homebrew/versions/gcc5
brew install binutils
brew install protobuf
brew install coreutils
brew install wget
```

Get all that installed, then run:

```shell
git clone {this github repo URL}
cd hush
git checkout v1.0.9-mac
./zcutil/build-mac.sh
```
When you are done building, you need to do a few things in the [Configuration](https://github.com/zcash/zcash/wiki/1.0-User-Guide#configuration) section of the Zcash User Guide differently because we are on the Mac. All instances of `~/.hush` need to be replaced by `~/Library/Application\ Support/Hush` 

The fetch-params.sh script, however, has already been altered to fetch the proving keys into the correct directory to conform to Mac specific naming conventions.

