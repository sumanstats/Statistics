unit module Misc;

# Similar to excel =MULTINOMIAL()
# Idea taken from brilliant, this converts Num to Int
sub multinomial_coef_excel(@array_num is copy) 
    is export {
    if @array_num.any < 0 { return "Not possible to calculate multinomial coefficient for negative values" };
    @array_num = @array_num.map: { $_.Int};
    my $sum = [+] @array_num;
    my $result = 1;
    my $i = 0;
    while $sum != 0 {
      $result = $result * choose($sum, @array_num[$i]);
      $sum = $sum - @array_num[$i];
      $i++;
    }
    return $result
}


multi multinomial_coef(@array where {sum(@array) <= 170}) 
    is export {
    # TODO write exception to handle @array.any < 0
    if @array.any < 0 { return "Not possible to calculate multinomial coefficient for negative values" };
    my $out = factorial(sum(@array));
    for @array -> $i {
        $out = $out/factorial($i)
    }
    $out
}

multi multinomial_coef(@array where {sum(@array) > 170}) 
    is export {
    # TODO write exception to handle @array.any < 0
    if @array.any < 0 { return "Not possible to calculate multinomial coefficient for negative values" };
    my $num = lfactorial(sum(@array));
    my $denom = sum(@array.map: {lfactorial($_)});
    exp($num - $denom)
}

sub linspace(
    $start is copy, 
    $end, 
    $num, 
    :$endpoint = True, 
    :$retstep = False
    ) 
    is export {
    my $step = $endpoint ?? ($end - $start)/($num - 1) !!  ($end-$start)/($num);
    my @list;
    for 1..$num {
        @list.push($start); 
        $start += $step
        }
    $retstep ?? (@list, $step) !! @list
}