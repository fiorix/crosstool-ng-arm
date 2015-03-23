# crosstool-ng for arm (Raspberry Pi)

This is a Dockerfile that builds an image containg [crosstool-ng](http://crosstool-ng.org)
for building software for ARM processors.

Old docker versions (e.g. v1.0.1) may have issues with images built from this
Dockerfile due to a bug on the `WORKDIR` instruction. Use newer versions.

With this base image you can compile software like ffmpeg, freeswitch, etc.
