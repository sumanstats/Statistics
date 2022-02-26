[![Actions Status](https://github.com/sumanstats/Statistics/workflows/test/badge.svg)](https://github.com/sumanstats/Statistics/actions)

NAME
====

Statistics - Raku module for doing statistics

SYNOPSIS
========

```raku
use Statistics;

my @test1 = [6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4];
my @test2 = [160.0,160.0,108.0,258.0,360.0,225.0,360.0,146.7,140.8,167.6,167.6,
            275.8,275.8,275.8,472.0,460.0,440.0,78.7,75.7,71.1,120.1,318.0,304.0,
            350.0,400.0,79.0,120.3,95.1,351.0,145.0,301.0,121.0];

# central tendency
mean(@test1); # 6.1875
median(@test1); # 6

# sample standard deviation
sd(@test1); # 1.7859216469465444

# population standard deviation
sd(@test1, sample => False); # 1.757795138803154

# correlation coefficients
pearson_cor_coef(@test1, @test2); # 0.9020328721469989
spearman_cor_coef(@test1, @test2); # 0.9276515785415314
kendall_cor_coef(@test1, @test2); # 0.8144262510988963
```

DESCRIPTION
===========

Statistics is a module to make it easier to do statistics in Raku programming language.

Many things are in the roadmap, only few are done.

NOTE
----

Because of absence of easy to use matrix library like numpy in Raku, implementing many of the tests is very difficult. Whatever can be done with Python statistics module will all be implemented.

AUTHOR
======

Dr Suman Khanal <suman81765@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Suman Khanal

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

