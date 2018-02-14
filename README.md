Perlin Simplex Noise C++ Implementation (1D, 2D, 3D)
========================================================

[![Travis CI Linux Build Status](https://travis-ci.org/SRombauts/SimplexNoise.svg)](https://travis-ci.org/SRombauts/SimplexNoise "Travis CI Linux Build Status")
[![AppVeyor Windows Build status](https://ci.appveyor.com/api/projects/status/github/SRombauts/SimplexNoise?svg=true)](https://ci.appveyor.com/project/SbastienRombauts/SimplexNoise "AppVeyor Windows Build status")

## About Perlin's "Simplex" Noise

- Perlin's "Classic" Noise (1984) is an algorithm producing pseudo-random fluctuations
  simulating natural looking variations, producing paterns all of the same size.
  It is a kind of gradiant-noise algorithm, invented by Ken Perlin while working
  on visual special effects for the Tron movie (1982).
  It works by interpolating pseudo-random gradiants defined in a multi-dimensionnal grid.
  [Ken Perlin original references](http://mrl.nyu.edu/~perlin/doc/oscar.html)
- Perlin's "Improved" Noise (2002) switches to a new interpolation fonction with
  a 2nd derivative zero at t=0 and t=1 to remove artifacts on integer values,
  and switches to using predefined gradients of unit lenght to the middle of each edges.
  [Ken Perlin original references](http://mrl.nyu.edu/~perlin/paper445.pdf)
- Perlin's "Simplex" Noise (2001) rather than placing each input point into a cubic grid,
  based on the integer parts of its (x,y,z) coordinate values, placed them onto a simplicial grid
  (think triangles instead of squares, pyramids instead of cubes...)
  [Ken Perlin original references](http://www.csee.umbc.edu/~olano/s2002c36/ch02.pdf)

## Coherent noise

A coherent noise is a type of smooth pseudorandom noise with following properties:.
- same input will always return the same output.
- small change of the input will produce small change of the output.
- large change of the input will produce random change of the output.

## Fractal noise / Fractional Brownian Motion

Fractional Brownian Motion (fBm) is the summation of successive octaves of coherent noise,
each with higher frequency and lower amplitude.

- Frequency of an octave of noise is the "width" of the pattern
- Amplitude of an octave of noise it the "height" of its feature
- Lacunarity specifies the frequency multipler between successive octaves (typically 2.0).
- Persistence is the loss of amplitude between successive octabes (usually 1/lacunarity).

## Code attribution

This C++ implementation is based on the speed-improved Java version 2012-03-09
by Stefan Gustavson (original Java source code in the public domain).
http://webstaff.itn.liu.se/~stegu/simplexnoise/SimplexNoise.java:
- Based on example code by Stefan Gustavson (stegu@itn.liu.se).
- Optimisations by Peter Eastman (peastman@drizzle.stanford.edu).
- Better rank ordering method by Stefan Gustavson in 2012.

[Simplex noise demystified](http://staffwww.itn.liu.se/~stegu/simplexnoise/simplexnoise.pdf),
Stefan Gustavson, Linköping University, Sweden (stegu@itn.liu.se), 2005-03-22

## License

Copyright (c) 2014-2018 Sebastien Rombauts (sebastien.rombauts@gmail.com)

Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
or copy at http://opensource.org/licenses/MIT)

## Current Status
### Features
- 1D, 2D and 3D Perlin Simplex Noise algorithms
- CMake project with, cpplint to check code style, cppchek to check code sanity, Doxygen to generate code documentaion

### Wishlist
- Add a standard Fractal summation of multiple octaves of noise
- Implement 4D Perlin Simplex Noise algorithms
- Add a parameter for permutation (offset and mask?) of the random table (could be way better than simple offseting applied by the user application)

## How to contribute
### GitHub website
The most efficient way to help and contribute to this wrapper project is to
use the tools provided by GitHub:
- please fill bug reports and feature requests here: https://github.com/SRombauts/SimplexNoise/issues
- fork the repository, make some small changes and submit them with pull-request

### Contact
You can also email me directly, I will answer any questions and requests.

## See Also
[SRombauts GitHub website](http://srombauts.github.com)

### Continuous Integration

This project is continuously tested under Ubuntu Linux with the gcc and clang compilers
using the Travis CI community service with the above CMake building and testing procedure.
It is also tested in the same way under Windows Server 2012 R2 with Visual Studio 2013 compiler
using the AppVeyor countinuous integration service.

Detailed results can be seen online:
 - https://travis-ci.org/SRombauts/SimplexNoise
 - https://ci.appveyor.com/project/SbastienRombauts/SimplexNoise

