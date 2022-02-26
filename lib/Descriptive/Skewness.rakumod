#skewness 
# Give an array of values of a variable to calculate its skewness
sub skewness(@a) is export {
    my $mean = mean_sample(@a);
    my @z = (@a <<->> $mean);
    sub raise($var) { $var*$var*$var };
    my $denom = @z.elems * (stdev_sample(@a))**3;
    return sum(@z>>.&raise)/$denom

}




# Give an array of values of a variable to calculate its excess kurtosis
# It calculates kurtosis in excess of 3
sub kurtosis(@a) is export {
    my $mean = mean_sample(@a);
    my @z = (@a <<->> $mean);
    sub raise($var) { $var*$var*$var*$var };
    my $denom = @z.elems * (stdev_sample(@a))**4;
    return sum(@z>>.&raise)/$denom - 3

}
