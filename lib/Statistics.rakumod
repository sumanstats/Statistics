sub EXPORT() {
    # Idea obtained from stackoverflow 
    # https://stackoverflow.com/questions/71365690/making-exported-functions-in-submodules-accessible-in-global-namespace-in-raku
    {
        use Descriptive::CentralTendency;
        use Descriptive::Dispersion;
        use Descriptive::FiveNum;
        use Correlation::PearsonSpearman;
        use Correlation::Kendall;
        use Correlation::BiweightMid;
        use Probability::Distribution;
        use Misc;
        return ::.pairs.grep(*.key ne '$_').Map;
    }
}


unit module Statistics;

#======================================================#
# Author: Dr Suman Khanal
# Date creation: Tuesday May 24 2022, 00:08:40
# ~: Statistics module
# File: Statistics.rakumod
#======================================================#


=begin pod

=begin code
  _____ _        _   _     _   _          
 / ____| |      | | (_)   | | (_)         
| (___ | |_ __ _| |_ _ ___| |_ _  ___ ___ 
 \___ \| __/ _` | __| / __| __| |/ __/ __|
 ____) | || (_| | |_| \__ \ |_| | (__\__ \
|_____/ \__\__,_|\__|_|___/\__|_|\___|___/v0.0.6

=end code   

[![Linux](https://github.com/sumanstats/Statistics/actions/workflows/linux.yml/badge.svg)](https://github.com/sumanstats/Statistics/actions/workflows/linux.yml)
[![Win64](https://github.com/sumanstats/Statistics/actions/workflows/windows-spec.yml/badge.svg)](https://github.com/sumanstats/Statistics/actions/workflows/windows-spec.yml)
[![MacOS](https://github.com/sumanstats/Statistics/actions/workflows/macos.yml/badge.svg)](https://github.com/sumanstats/Statistics/actions/workflows/macos.yml)
[![Build status](https://ci.appveyor.com/api/projects/status/8k6m9d1e7lcby5bm/branch/main?svg=true)](https://ci.appveyor.com/project/sumanstats/statistics/branch/main)

[![Version](https://raku.land/zef:sumankhanal/Statistics/badges/version)](https://raku.land/zef:sumankhanal/Statistics)
[![Downloads](https://raku.land/zef:sumankhanal/Statistics/badges/downloads)](https://raku.land/zef:sumankhanal/Statistics)
[![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-brightgreen.svg)](https://github.com/sumanstats/Statistics)           


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

# numpy linspace
linspace(2.1, 3.2, 5, endpoint => False, retstep => False); # [2.1, 2.32, 2.54, 2.76, 2.98]
linspace(1, 3, 3, endpoint => False, retstep => True); # ([1, 1.666667, 2.333333], 0.666667)

# pdf of normal distribution 
raku_dnorm(5); # 1.4867195147342977e-06
raku_dnorm(3, mean => 2, sd => 1); # 0.24197072451914337
raku_dnorm(3, mean => 2, sd => -1); # NaN;
raku_dnorm(3, mean => 2, sd => 0); # 0;

# cdf of normal distribution 
raku_pnorm(5); # 0.9999997133484281
raku_pnorm(4, mean => 2, sd => 3); # 0.7475074624530771
raku_pnorm(4, mean => 2, sd => 3, log_p => True) # -0.29101099055230867

# Quantiles 
raku_qnorm(0.7) # with default  mean=>0, sd => 1; # 0.5244005127080407
raku_qnorm(1); # Inf
raku_qnorm(5); # NaN

# Random number generator for normal distribution 
set_seed(111,222);
raku_rnorm(12) # (0.2933064931910023 -0.43157564134676835 0.1280404124560668 -1.001461811038476 
                 -0.9219453227924342 1.2988990178409578 -0.46867271131577315 -1.2678609176619775 
                  0.3596981905325252 0.35262105537769173 0.5770092689090144 -1.0392300758070165)

# Binomial coefficients
choose(3,1); # 3;
choose(0,0); # 1;
choose(3,5); # 0;
choose(30,4); # 27405;

# Multinomial coefficients
multinomial_coef([3,1,1,3,4.2, 8, 90, 40]); # 2.717246116384229e+69;
multinomial_coef([3,1,1,3,4.2, 8, 90, 140]); # 1.0317825100856673e+106;
multinomial_coef([2,4,5,7]); # 220540320

# Excel variant of multinomial coefficient
multinomial_coef_excel([3,1.9,1,3,4.2]); # 554400;

# Factorials
factorial(9); # 362880

=end code

=head1 DESCRIPTION

Statistics is a module to make it easier to do statistics in Raku programming language.



=head2 Features

=item [x] descriptive statistics
=item [x] correlation coefficients
=item [x] pdf, cdf of probability distributions (all the probability distributions in R v4.3.1 are included)
=item [x] random number generators
=item [ ] parametric tests
=item [ ] non-parametric tests


=head3 INSTALLATION

The module contains **compiled** code. `gcc`, `cmake` and `ninja` 
are required for compilation and should be available in `PATH`.


=head3 ISSUES

https://github.com/sumanstats/Statistics/issues


=head3 PULL REQUESTS

Improvement of the code base and efficient implementation of the algorithms are welcome.


=head1 AUTHOR

Dr Suman Khanal <suman81765@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Dr Suman Khanal

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=head2 SUPPORT

<form action="https://www.paypal.com/donate" method="post" target="_top">
<input type="hidden" name="hosted_button_id" value="HZSEMN4SHC3TL" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_NP/i/scr/pixel.gif" width="1" height="1" />
</form>


=end pod
