unit module Misc;

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