unit module Correlation::Kendall;

# Kendall tau-b correlation coefficient in Raku
# Run time Big O(n^2)



# Seems better than sorting in raku because it has more jit compiled frames
# TODO write more efficient O(nlogn) algorithm
# https://afni.nimh.nih.gov/pub/dist/src/ktaub.c


sub concordant_discordant_rties_sties(@var1,@var2) {    
    # multiple variable declarations
    my $number_of_elements=@var1.elems;
    die "Provide equal number of elements" if $number_of_elements != @var2.elems;
    my ($concordant, $discordant, $x_ties, $y_ties) = (0, 0, 0, 0);
    my ($i, $j);
    loop ($i = 0; $i < ($number_of_elements - 1); $i++) {
        loop ($j = $i + 1; $j < $number_of_elements; $j++) {
            if @var1[$j] > @var1[$i] {
                if @var2[$j] > @var2[$i] {
                    $concordant+=1;
                } elsif  @var2[$j] < @var2[$i] {
                    $discordant+=1;
                } else {
                    $y_ties+=1;
                } 
            } elsif @var1[$j] < @var1[$i] {
                if @var2[$j] < @var2[$i] {
                    $concordant+=1;
                } elsif  @var2[$j] > @var2[$i] {
                    $discordant+=1;
                } else {
                    $y_ties+=1;
                } 
            } else {
                $x_ties+=1 if @var2[$j] != @var2[$i]
            }
        }
    } 
    
    return ($concordant, $discordant, $x_ties, $y_ties)
}

# less performant code

# sub concordant_discordant_rties_sties(@var1,@var2) {    
#     # multiple variable declarations
#     my ($i, $concordant, $discordant, $x_ties, $y_ties) = (0, 0, 0, 0, 0);
#     my $number_of_elements=@var1.elems;
#     while $i != $number_of_elements - 1 {
#         my $j = $i + 1;
#         while $j != $number_of_elements {
#             if @var1[$j] > @var1[$i] and @var2[$j] > @var2[$i] {
#                 $concordant+=1
#             } elsif @var1[$j] < @var1[$i] and @var2[$j] < @var2[$i] {
#                 $concordant+=1
#             } elsif @var1[$j] > @var1[$i] and @var2[$j] < @var2[$i] {
#                 $discordant+=1
#             } elsif @var1[$j] < @var1[$i] and @var2[$j] > @var2[$i] {
#                 $discordant+=1
#             } elsif @var1[$j] == @var1[$i] and @var2[$j] != @var2[$i] {
#                 $x_ties+=1
#             } elsif @var1[$j] != @var1[$i] and @var2[$j] == @var2[$i] {
#                 $y_ties+=1
#             }
#             $j+=1
#         }
#         $i+=1;
#         }
    
#     return ($concordant, $discordant, $x_ties, $y_ties)
# }





sub kendall_cor_coef(@data1, @data2) is export {
    my ($concordant, $discordant, $x_ties, $y_ties) =
            concordant_discordant_rties_sties(@data1, @data2);
    return ($concordant - $discordant)/sqrt(($concordant + $discordant + $x_ties)*
                                            ($concordant + $discordant + $y_ties))
}