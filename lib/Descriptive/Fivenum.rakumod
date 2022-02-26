# Returns Tukey's five number summary 
# (minimum, lower-hinge, median, upper-hinge, maximum) for the input data.


use Descriptive::CentralTendency;
use Descriptive::Dispersion;


# TODO quartiles Q1 and Q3
sub fivenum(@data) is export {
    my ($min, $max) = range(@data);
    return $min, median(@data), $max
}