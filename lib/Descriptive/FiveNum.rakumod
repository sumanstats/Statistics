unit module Descriptive::FiveNum;


sub fivenum(@data is copy) is export {

  #`[ Return fivenum summary of data
  Sample quartiles are calculated using Tukey's method.
  
  Q1 and Q3 are calculated as the medians of the two halves of the data,
  where the median Q2 is included in both halves. This is equivalent to
  Tukey's hinges H1, M, H2.
  ]
  my $n = @data.elems;
  die "Data is empty" if $n==0;
  @data = @data.sort();
  # min max in sorted data
  my ($min, $max) = @data[0], @data[*-1]; 
  my $i = ($n+1) div 4;
  my $m = $n div 2;
  my ($q1, $q2, $q3);
  if ($n mod 4) ∈ (0, 3) {
      $q1 = (@data[$i] + @data[$i-1])/2;
      $q3 = (@data[*-($i+1)] + @data[*-$i])/2;
    } else {
      $q1 = @data[$i];
      $q3 = @data[*-($i+1)]
    }
  if $n mod 2 == 0 {
      $q2 = (@data[$m-1] + @data[$m])/2
    } else {
      $q2 = @data[$m]
    }          
  return ($min, $q1, $q2, $q3, $max)
}
