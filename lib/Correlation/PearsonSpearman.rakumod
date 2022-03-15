unit module Correlation::PearsonSpearman;

# Fractional ranks in a set of data 

sub fractional_ranking(@data is copy) {
    my @new = @data.BagHash.sort(+*.key); # calling .reverse ranks the data from highest to lowest
    my $i=1; # rank start at 1 
    my %internal_hash; # its a hash which contains rank for each unique value
    for @new {
        if .value == 1 { # if value is 1 push the corresponding rank r as $i
            %internal_hash.push(.key => $i); 
            $i+=1
        } else {
            %internal_hash.push(.key => $i + (.value - 1)/2); # push  r + (n-1)/2
            $i = $i + .value
        }
    }

    # iterate through data and provide rank for each individual values
    for @data {
        $_ = %internal_hash{$_}
        }
    return @data

}


# Function for calculating pearson correlation coefficient

# Ultimate goal is to use one-pass and numerically stable algorithm as in paper
# https://crypto.fit.cvut.cz/sites/default/files/publications/fulltexts/pearson.pdf

sub pearson_cor_coef(@x, @y) is export {
    my $n = @x.elems;
    # exit if two variables have differing number of values
    die "Two variables do not have same length" if $n != @y.elems;
    my $sum_x = sum(@x);
    my $square_sum_x = $sum_x ** 2;
    my $sum_y = sum(@y);
    my $square_sum_y = $sum_y ** 2;
    my $sum_x_square = sum(@x.map(* **2)); # can also be written as @x»².sum
    my $sum_y_square = sum(@y.map(* **2)); # can also be written as @y»².sum
    my $sum_xy = sum(@x Z* @y);
    my $numerator = ($n * $sum_xy) - ($sum_x * $sum_y);
    my $denominator = sqrt(($n*$sum_x_square - $square_sum_x) * 
                           ($n*$sum_y_square - $square_sum_y)) ;
    return $numerator/$denominator
}



# Function for calculating spearman correlation coefficient
# Its a special case where pearson correlation is calculated between the ranks
# of two variables 

sub spearman_cor_coef(@data1, @data2) is export {
    die "Two variables do not have same length" if @data1.elems != @data2.elems;
    return pearson_cor_coef(
        fractional_ranking(@data1),
        fractional_ranking(@data2)
    )

}