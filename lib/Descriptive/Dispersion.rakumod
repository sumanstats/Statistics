unit module Descriptive::Dispersion;


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
  my $max = @data[0];
  my $min = @data[0];
  my $number_elems = @data.elems;
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


# standard deviation




# coefficient of variation
