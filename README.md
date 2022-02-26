NAME
====

Stats - Raku module for doing statistics

SYNOPSIS
========

```raku
use Stats;

my @test1 = <6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 
             8 4 4 4 8 6 8 4>;
my @test2 = <160.0 160.0 108.0 258.0 360.0 225.0 360.0 146.7 
             140.8 167.6 167.6 275.8 275.8 275.8 472.0 460.0 
             440.0  78.7  75.7  71.1 120.1 318.0 304.0 350.0 
             400.0  79.0 120.3  95.1 351.0 145.0 301.0 121.0>;

pearson_correlation_coef(@test1, @test2); # 0.9020328721469989
spearman_correlation_coefficient(@test1, @test2); # 0.9276515785415314
kendall_cor_coef(@test1, @test2); # 0.8144262510988963
```

DESCRIPTION
===========

Stats is a module to make it easier to do statistics in Raku programming language.

AUTHOR
======

Dr Suman Khanal <suman81765@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Suman Khanal

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

