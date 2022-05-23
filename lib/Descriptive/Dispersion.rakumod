unit module Descriptive::Dispersion;

#======================================================#
# Author: Dr Suman Khanal
# Date creation: Tuesday May 24 2022, 00:14:06
# ~: Measures of dispersion
# File: Dispersion.rakumod
#======================================================#


# simple but has to do double pass

# big array may take time 

# sub range(@data) is export {
#     return max(@data) - min(@data)
# }


# single pass algorithm


# Returns minimum and maximum values of an array
# This is similar to range function in R
# @data can be numeric or character vector
sub range(@data) is export {
    my $first_elem = @data[0];
    my ($max, $min, $number_elems) = $first_elem, $first_elem, @data.elems;
    for 1..^$number_elems -> $i {
        my $current_val = @data[$i];
        if $current_val gt $max {
            $max = $current_val
        } elsif $current_val lt $min {
            $min = $current_val
        }   
    }
    return $min, $max
}




# quartile deviations



# mean absolute deviation




# variance 
# Default is to calculate sample variance
# If you want population variance, pass False as the parameter 

# example my @data = [2.75, 1.75, 1.25, 0.25, 0.5, 1.25, 3.5];
# say variance(data, sample => False);

sub variance(@data, :$sample = True) is export {
    my $number_of_elements = @data.elems;
    return NaN if $number_of_elements < 2;
    # for the time being return NaN while in R it gives NA (NA not available in Raku)
    # work on new type NA
    my $mean = @data[0];
    my $sum_of_squares_of_differences_from_the_current_mean = 0;
    for 1..($number_of_elements-1) {
        my $x = @data[$_];
        my $old_mean = $mean;
        my $old_sum_of_squares_of_differences_from_the_current_mean=$sum_of_squares_of_differences_from_the_current_mean;
        $mean = $old_mean + ($x-$old_mean)/($_+1);
        $sum_of_squares_of_differences_from_the_current_mean = $old_sum_of_squares_of_differences_from_the_current_mean + ($x-$mean)*($x-$old_mean);
    }
    return $sum_of_squares_of_differences_from_the_current_mean/($number_of_elements - ($sample ?? 1 !! 0))
}



# Coefficient of variation 
# sd/mean * 100

sub coef_variation(@data) is export {
    my $number_of_elements = @data.elems;
    return NaN if $number_of_elements < 2;
    # for the time being return NaN while in R it gives NA (not available)
    # work on new type NA
    my $mean = @data[0];
    my $sum_of_squares_of_differences_from_the_current_mean = 0;
    for 1..($number_of_elements-1) {
        my $x = @data[$_];
        my $old_mean = $mean;
        my $old_sum_of_squares_of_differences_from_the_current_mean=$sum_of_squares_of_differences_from_the_current_mean;
        $mean = $old_mean + ($x-$old_mean)/($_+1);
        $sum_of_squares_of_differences_from_the_current_mean = $old_sum_of_squares_of_differences_from_the_current_mean + ($x-$mean)*($x-$old_mean);
    }
    my $variance = $sum_of_squares_of_differences_from_the_current_mean/($number_of_elements-1);
    return sqrt($variance)/$mean * 100
}







# covariance





# standard deviation

sub sd(@data, :$sample = True) is export {
    if $sample == False {
        sqrt(variance(@data, sample => False))      
    } else {
        sqrt(variance(@data))
    }
}






