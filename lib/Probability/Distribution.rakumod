unit module Probability::Distribution;

use NativeCall;
constant RMATH = %?RESOURCES<libraries/Rmath>;
# Please note: In windows supply libraries/libRmath, not Rmath only, tested in Windows 10
# However in Linux supply libraries/Rmath

# Also in resources field in META6.json in windows, put "libraries/libRmath"
# In Linux put "libraries/Rmath"
# In windows I use msys2 shell from Rtools42, which has make available
# Add **gcc and make from Rtool42 in your path** before installing this module.

# Better to avoid using make because it has so many names its not consistent 
# Best would be to rather use ninja 


# Function signatures


#	/* Normal Distribution */


sub dnorm4(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * };

sub pnorm5(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };

sub qnorm5(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };    

sub rnorm(num64, num64) returns num64
    is native( RMATH ) { * };   


#	/* Uniform Distribution */

sub dunif(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * };    
sub punif(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };    
sub qunif(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };    
sub runif(num64, num64) returns num64
    is native( RMATH ) { * };    

#	/* Gamma Distribution */

sub dgamma(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * };    
sub pgamma(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };    
sub qgamma(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };    
sub rgamma(num64, num64) returns num64
    is native( RMATH ) { * };    


#	/* Beta Distribution */


sub dbeta(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 
sub pbeta(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qbeta(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rbeta(num64, num64) returns num64
    is native( RMATH ) { * }; 



#	/* Lognormal Distribution */

sub dlnorm(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 
sub plnorm(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qlnorm(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rlnorm(num64, num64) returns num64
    is native( RMATH ) { * }; 


#	/* Chi-squared Distribution */

sub dchisq(num64, num64, int32) returns num64
    is native( RMATH ) { * }; 

sub pchisq(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qchisq(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rchisq(num64) returns num64
    is native( RMATH ) { * }; 


#	/* Non-central Chi-squared Distribution */

sub dnchisq(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 

sub pnchisq(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qnchisq(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rnchisq(num64, num64) returns num64
    is native( RMATH ) { * }; 

#	/* F Distibution */


sub df(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 

sub pf(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 

sub qf(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rf(num64, num64) returns num64
    is native( RMATH ) { * }; 


#	/* Student t Distibution */


sub dt(num64, num64, int32) returns num64
    is native( RMATH ) { * }; 


sub pt(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qt(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rt(num64) returns num64
    is native( RMATH ) { * }; 


#	/* Binomial Distribution */

sub dbinom(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 

sub pbinom(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qbinom(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rbinom(num64, num64) returns num64
    is native( RMATH ) { * }; 

#	/* Multnomial Distribution */

sub rmultinom(int32, num64 is rw, int32, int32 is rw)
    is native( RMATH ) { * }; 




#	/* Cauchy Distribution */

sub dcauchy(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 



sub pcauchy(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qcauchy(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rcauchy(num64, num64) returns num64
    is native( RMATH ) { * }; 




#	/* Exponential Distribution */

sub dexp(num64, num64, int32) returns num64
    is native( RMATH ) { * }; 

sub pexp(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qexp(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rexp(num64) returns num64
    is native( RMATH ) { * }; 




#	/* Geometric Distribution */


sub dgeom(num64, num64, int32) returns num64
    is native( RMATH ) { * };

sub pgeom(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };
sub qgeom(num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };
sub rgeom(num64) returns num64
    is native( RMATH ) { * };


#	/* Hypergeometric Distibution */


sub dhyper(num64, num64, num64, num64, int32) returns num64
    is native( RMATH ) { * }; 

sub phyper(num64, num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub qhyper(num64, num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * }; 
sub rhyper(num64, num64, num64) returns num64
    is native( RMATH ) { * }; 




#	/* Negative Binomial Distribution */

sub dnbinom(num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub pnbinom(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qnbinom(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rnbinom(num64, num64) returns num64 
    is native( RMATH ) { * };







#	/* Poisson Distribution */

sub	dpois(num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub	ppois(num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub	qpois(num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub	rpois(num64) returns num64 
    is native( RMATH ) { * };

#	/* Weibull Distribution */

sub dweibull(num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub pweibull(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qweibull(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rweibull(num64, num64) returns num64 
    is native( RMATH ) { * };





#	/* Logistic Distribution */

sub dlogis(num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub plogis(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qlogis(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rlogis(num64, num64) returns num64 
    is native( RMATH ) { * };



#	/* Non-central Beta Distribution */

sub dnbeta(num64, num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub pnbeta(num64, num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qnbeta(num64, num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rnbeta(num64, num64, num64) returns num64 
    is native( RMATH ) { * };

#	/* Non-central F Distribution */

sub dnf(num64, num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub pnf(num64, num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qnf(num64, num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };




#	/* Non-central Student t Distribution */

sub dnt(num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub pnt(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qnt(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };

#	/* Studentized Range Distribution */

sub ptukey(num64, num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };
sub qtukey(num64, num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };




#	/* Wilcoxon Rank Sum Distribution */

sub dwilcox(num64, num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub pwilcox(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qwilcox(num64, num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rwilcox(num64, num64) returns num64 
    is native( RMATH ) { * };

#	/* Wilcoxon Signed Rank Distribution */

sub dsignrank(num64, num64, int32) returns num64 
    is native( RMATH ) { * };
sub psignrank(num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qsignrank(num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rsignrank(num64) returns num64 
    is native( RMATH ) { * };

#	/* Gamma and Related Functions */

sub gammafn(num64) returns num64
    is native( RMATH ) { * }; #gamma in R
sub lgammafn(num64) returns num64 
    is native( RMATH ) { * }; # lgamma in R

sub psigamma(num64, num64) returns num64 
    is native( RMATH ) { * };
sub digamma(num64) returns num64 
    is native( RMATH ) { * };
sub trigamma(num64) returns num64 
    is native( RMATH ) { * };


sub beta(num64, num64) returns num64 
    is native( RMATH ) { * };
sub lbeta(num64, num64) returns num64 
    is native( RMATH ) { * };
sub choose(num64, num64) returns num64 
    is native( RMATH ) { * };
sub lchoose(num64, num64) returns num64 
    is native( RMATH ) { * };

#	/* Bessel Functions */

sub bessel_i(num64, num64, num64) returns num64 
    is native( RMATH ) { * };
sub bessel_j(num64, num64) returns num64 
    is native( RMATH ) { * };
sub bessel_k(num64, num64, num64) returns num64 
    is native( RMATH ) { * };
sub bessel_y(num64, num64) returns num64 
    is native( RMATH ) { * };








multi raku_pt($x, $n, :$lower_tail = True, :$log_p = False) is export {
    my $prob = pt($x.Num, $n.Num, $lower_tail ?? 1 !! 0 , 0);
    $log_p ?? log($prob) !! $prob
}

# Also valid 
# multi raku_pt($x, $n, :$lower_tail = True, :$log_p = False) is export {
#     pt($x.Num, $n.Num, $lower_tail ?? 1 !! 0 , $log_p ?? 1 !! 0);
# }

multi raku_pt(@x, $n, :$lower_tail = True, :$log_p = False) is export {
    @x.map: { raku_pt($_, $n, :$lower_tail, :$log_p)}
}



sub raku_dnorm($x, :$mean = 0 , :$sd = 1, :$log = False ) is export {
    return dnorm4($x.Num, $mean.Num, $sd.Num, $log ?? 1 !! 0);

}

sub raku_pnorm($x, :$mean = 0 , :$sd = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    return pnorm5($x.Num, $mean.Num, $sd.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);

}

sub raku_qnorm($x, :$mean = 0 , :$sd = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    return qnorm5($x.Num, $mean.Num, $sd.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
}

sub raku_rnorm($n, :$mean = 0, :$sd = 1) is export {
    (1..$n).map: {rnorm($mean.Num, $sd.Num)}
}

# The (non-central) Chi-Squared Distribution

sub raku_dchisq($x, $df, :$ncp?, :$log = False) is export { 
    if defined $ncp and $ncp < 0 {
        die "ncp should be non-negative";
    }
    if defined $ncp and $ncp >= 0 {
        return dnchisq($x.Num, $df.Num, $ncp.Num, $log ?? 1 !! 0 )
    }
    return dchisq($x.Num, $df.Num, $log ?? 1 !! 0 )
}

sub raku_pchisq($q, $df, :$ncp?, :$lower_tail = True, :$log_p = False) is export { 
    if defined $ncp and $ncp < 0 {
        die "ncp should be non-negative";
    }
    if defined $ncp and $ncp >= 0 {
        return pnchisq($q.Num, $df.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )
    }
    return pchisq($q.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )

}


sub raku_qchisq($p, $df, :$ncp?, :$lower_tail = True, :$log_p = False) is export { 
    if defined $ncp and $ncp < 0 {
        die "ncp should be non-negative";
    }
    if defined $ncp and $ncp >= 0 {
        return qnchisq($p.Num, $df.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )
    }
    return qchisq($p.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )


 }



sub raku_rchisq($n, $df, :$ncp?) is export { 
    if defined $ncp and $ncp < 0 {
        die "ncp should be non-negative";
    }
    if defined $ncp and $ncp >= 0 {
        return (1..$n).map: {rnchisq($df.Num, $ncp.Num)}
    }
    return (1..$n).map: {rchisq($df.Num)}

}



# Other functions

sub factorial($x) is export {
    gammafn(($x + 1).Num)
}

sub raku_choose($x,$y) is export {
    choose($x.Num, $y.Num)
}

sub multinomial_coef(+@array_num) is export {
  if @array_num.any < 0 { return "Not possible to calculate multinomial coefficient for negative values" };
  my $sum = [+] @array_num;
  my $result = 1;
  my $i = 0;
  while $sum != 0 {
    $result = $result * raku_choose($sum, @array_num[$i]);
    $sum = $sum - @array_num[$i];
    $i++;
  }
  return $result
}
