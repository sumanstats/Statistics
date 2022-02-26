unit module Kendall;

# Kendall tau-b correlation coefficient in Raku
# Run time Big O(n^2)



# Seems better than sorting in raku because it has more jit compiled frames
# TODO write more efficient O(nlogn) algorithm

sub concordant_discordant_rties_sties(@var1,@var2) {    
    my $i=0;
    my $concordant=0;
    my $discordant=0;
    my $r_ties=0;
    my $s_ties=0;
    my $number_of_elements=@var1.elems;
    while $i != $number_of_elements - 1 {
        my $j = $i + 1;
        while $j != $number_of_elements {
            if @var1[$j] > @var1[$i] and @var2[$j] > @var2[$i] {
                $concordant+=1
            } elsif @var1[$j] < @var1[$i] and @var2[$j] < @var2[$i] {
                $concordant+=1
            } elsif @var1[$j] > @var1[$i] and @var2[$j] < @var2[$i] {
                $discordant+=1
            } elsif @var1[$j] < @var1[$i] and @var2[$j] > @var2[$i] {
                $discordant+=1
            } elsif @var1[$j] == @var1[$i] and @var2[$j] != @var2[$i] {
                $r_ties+=1
            } elsif @var1[$j] != @var1[$i] and @var2[$j] == @var2[$i] {
                $s_ties+=1
            }
            $j+=1
        }
        $i+=1;
        }
    
    return ($concordant, $discordant, $r_ties, $s_ties)
}





sub kendall_cor_coef(@data1, @data2) is export {
    my ($concordant, $discordant, $r_ties, $s_ties) =
            concordant_discordant_rties_sties(@data1, @data2);
    return ($concordant - $discordant)/sqrt(($concordant + $discordant + $r_ties)*
                                            ($concordant + $discordant + $s_ties))
}