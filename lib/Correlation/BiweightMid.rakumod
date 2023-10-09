#======================================================#
# Author: Dr Suman Khanal
# Date creation: Tuesday May 24 2022, 00:12:24
# ~: Biweight mid correlation coefficient
# File: BiweightMid.rakumod
#======================================================#


#`[
Calculating biweight midcorrelation which is
more robust against outliers
https://en.wikipedia.org/wiki/Biweight_midcorrelation
]

unit module Correlation::BiweightMid;


use Descriptive::CentralTendency;

sub mad(@x) is export {
    #`[
    Median absolute deviation
    Median of absolute deviations from mean
    ]
    my $median = median(@x);
    median (@x »-» $median)».abs;
}

# Identity function 
sub identity_function($x) {
    $x > 0 ?? 1 !! 0
}



sub u_i(@x) {
    my $median = median(@x);
    my @deviation_from_median = @x »-» $median;
    my $mad = median @deviation_from_median».abs;
    return @deviation_from_median.map: {$_/(9*$mad)}

}


sub w_i(@x) {
    my @u_i = u_i(@x);
    @u_i.map: {(1-$_*$_)**2  * identity_function(1-abs($_))}
}


sub robust_standardised_data(@x) {
    my $median = median(@x);
    my @deviation_from_median = @x »-» $median;
    my @numerator = @deviation_from_median Z* w_i(@x);
    my $denominator = sqrt(sum @numerator.map: {$_*$_});
    return @numerator.map: {$_/$denominator}
}


sub bi_cor_coef(@x, @y) is export {
    # Biweight mid correlation 
    # robust data
    die "Two variables do not have same length" if @x.elems != @y.elems;
    return "NA" if (mad(@x) | mad(@y)) == 0; # until NA datatype is created
    return sum robust_standardised_data(@x) Z* robust_standardised_data(@y)
}
