/**
 * @file    test.cpp
 * @brief   Basic compilation test for my Perlin Simplex Noise C++ Implementation (1D, 2D, 3D, 4D).
 *
 * Copyright (c) 2014-2018 Sebastien Rombauts (sebastien.rombauts@gmail.com)
 */

#include <cstdint>

#include "SimplexNoise.h"

int main() {
    float x     = 0.123f;                   // Define a float coordinate
    float noise = SimplexNoise::noise(x);   // Get the noise value for the coordinate
    (void)noise;

    return 0;
}
