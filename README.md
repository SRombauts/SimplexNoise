Perlin Simplex Noise C++ Implementation (1D, 2D, 3D, 4D)
========================================================

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
  based on the integer parts of its (x,y,z) coordinate values, placed them onto a simplicial grid  (think triangles instead of squares, pyramids instead of cubes...)
  [Ken Perlin original references](http://www.csee.umbc.edu/~olano/s2002c36/ch02.pdf)

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

Copyright (c) 2014 Sébastien Rombauts (sebastien.rombauts@gmail.com)

Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
or copy at http://opensource.org/licenses/MIT)

## How to contribute
### GitHub website
The most efficient way to help and contribute to this wrapper project is to
use the tools provided by GitHub:
- please fill bug reports and feature requests here: https://github.com/SRombauts/SQLiteCpp/issues
- fork the repository, make some small changes and submit them with pull-request

### Contact
You can also email me directly, I will answer any questions and requests.

## See Also
[SRombauts GitHub website](http://srombauts.github.com)
