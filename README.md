# Natform

Nat's foray into Ruby Game Development using [Gosu][]. His goal is to make a simple platformer where you run, jump and shoot things.

[Gosu]: http://www.libgosu.org/

## Development

 NOTE: You need universe enabled in Ubuntu for this install to work.

 * `sudo aptitude install build-essential freeglut3-dev libfreeimage-dev libgl1-mesa-dev libopenal-dev libpango1.0-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsndfile-dev libxinerama-dev`
 * `gem install gosu chipmunk rmagick`

 NOTE: rmagick may have dependencies I don't know about, probably some ImageMagic libraries or something.

 * [Chipmunk][] is a Physics engine.
 * [RMagick][] is for dealing with image manipulation.
 * [Chingu][] is a layer ontop of Gosu to make it simpler.

[RMagick]: https://github.com/rmagick/rmagick
[Chipmunk]: https://github.com/slembcke/Chipmunk-Physics
[Chingu]: https://github.com/ippa/chingu

## TODO

 * Automate packaging for Windows: <https://github.com/jlnr/gosu/wiki/Ruby-Packaging-on-Windows>
 * Automate packaging for OSX: <https://github.com/jlnr/gosu/wiki/Ruby-Packaging-on-OS-X>
 * Automate packaging for Linux: ???

## Docs

 * <http://rubydoc.info/github/ippa/chingu/master/file/README.rdoc>

