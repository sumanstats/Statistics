sub EXPORT() {
    {
        use Descriptive::CentralTendency;
        use Descriptive::Dispersion;
        use Descriptive::FiveNum;
        use Correlation::PearsonSpearman;
        use Correlation::Kendall;
        use Correlation::BiweightMid;
        return ::.pairs.grep(*.key ne '$_').Map;
    }
}

unit module Statistics;


=begin pod

[![Actions Status](https://github.com/sumanstats/Statistics/workflows/test/badge.svg)](https://github.com/sumanstats/Statistics/actions)
[![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-brightgreen.svg)](https://github.com/sumanstats/Statistics)


=begin code
  _____ _        _   _     _   _          
 / ____| |      | | (_)   | | (_)         
| (___ | |_ __ _| |_ _ ___| |_ _  ___ ___ 
 \___ \| __/ _` | __| / __| __| |/ __/ __|
 ____) | || (_| | |_| \__ \ |_| | (__\__ \
|_____/ \__\__,_|\__|_|___/\__|_|\___|___/v0.0.4

=end code                                          


=head1 NAME

Statistics - Raku module for doing statistics

=head1 SYNOPSIS

=begin code :lang<raku>

use Statistics;

my @data1 = [6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4];
my @data2 = [160.0,160.0,108.0,258.0,360.0,225.0,360.0,146.7,140.8,167.6,167.6,
            275.8,275.8,275.8,472.0,460.0,440.0,78.7,75.7,71.1,120.1,318.0,304.0,
            350.0,400.0,79.0,120.3,95.1,351.0,145.0,301.0,121.0];

# central tendency
mean(@data1); # 6.1875
median(@data1); # 6

# sample standard deviation
sd(@data1); # 1.7859216469465444

# population standard deviation
sd(@data1, sample => False); # 1.757795138803154

# Coefficient of variation
coef_variation(@data2); # 53.71779066522493

# Five number summary
fivenum(@data2); # (71.1 120.65 196.3 334 472)

# correlation coefficients
pearson_cor_coef(@data1, @data2); # 0.9020328721469989
spearman_cor_coef(@data1, @data2); # 0.9276515785415314
kendall_cor_coef(@data1, @data2); # 0.8144262510988963

# Biweight_midcorrelation 
# more robust, less sensitive to outliers
bi_cor_coef(@data1, @data2); # 0.9146470012038392

=end code

=head1 DESCRIPTION

Statistics is a module to make it easier to do statistics in Raku programming language.

Many things are in the roadmap, only few are done.


=head2 Expected Features

=item basic descriptive statistics
=item correlation coefficients
=item pdf, cdf of probability distributions 
=item random number generators
=item parametric tests
=item non-parametric tests




=head3 ISSUES

https://github.com/sumanstats/Statistics/issues


=head3 PULL REQUESTS

Improvement of the code base and efficient implementation of the algorithms are welcome.


=head1 AUTHOR

Dr Suman Khanal <suman81765@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Dr Suman Khanal

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
