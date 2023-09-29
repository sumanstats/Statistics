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




####	Random number generators	####

sub norm_rand() returns num64
    is native( RMATH ) { * };

sub unif_rand() returns num64
    is native( RMATH ) { * };

sub exp_rand() returns num64
    is native( RMATH ) { * };

sub set_seed(int32, int32)
    is native( RMATH ) { * };

sub get_seed(int32 is rw, int32 is rw)
    is native( RMATH ) { * };

sub raku_set_seed($a, $b) is export {
    set_seed($a.Int, $b.Int)
}

####	Normal distribution	####

# dnorm(x, mean = 0, sd = 1, log = FALSE)
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# rnorm(n, mean = 0, sd = 1)


sub raku_dnorm($x, :$mean = 0 , :$sd = 1, :$log = False ) is export {
    return dnorm4($x.Num, $mean.Num, $sd.Num, $log ?? 1 !! 0);

}

sub raku_pnorm($q, :$mean = 0 , :$sd = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    return pnorm5($q.Num, $mean.Num, $sd.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);

}

sub raku_qnorm($p, :$mean = 0 , :$sd = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    return qnorm5($p.Num, $mean.Num, $sd.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
}

sub raku_rnorm($n, :$mean = 0, :$sd = 1) is export {
    (1..$n).map: {rnorm($mean.Num, $sd.Num)}
}

####	Uniform distribution	####

# dunif(x, min = 0, max = 1, log = FALSE)
# punif(q, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
# qunif(p, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
# runif(n, min = 0, max = 1)

sub raku_dunif($x, :$min = 0 , :$max = 1, :$log = False) 
    is export {
    return dunif($x.Num, $min.Num, $max.Num, $log ?? 1 !! 0);

}

sub raku_punif($q, :$min = 0 , :$max = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    return punif($q.Num, $min.Num, $max.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);;

}

sub raku_qunif($p, :$min = 0 , :$max = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    return qunif($p.Num, $min.Num, $max.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);

}

sub raku_runif($n, :$min = 0 , :$max = 1) 
    is export {
    (1..$n).map: {runif($min.Num, $max.Num)}
}


####	Gamma distribution 	####


# dgamma(x, shape, rate = 1, scale = 1/rate, log = FALSE)
# pgamma(q, shape, rate = 1, scale = 1/rate, lower.tail = TRUE,
#        log.p = FALSE)
# qgamma(p, shape, rate = 1, scale = 1/rate, lower.tail = TRUE,
#        log.p = FALSE)
# rgamma(n, shape, rate = 1, scale = 1/rate)



sub raku_dgamma($x, $shape , :$rate is copy, :$scale is copy, :$log = False) 
    is export {
    if $rate.defined && $scale.defined {
        if abs($rate*$scale - 1) < 1e-15 {
            warn("Warning:\n\tspecify 'rate' or 'scale' but not both")
        }
        else {
            die "specify 'rate' or 'scale' but not both"
        }
    } 
    $rate //= 1;
    $scale //= 1/$rate;
    return dgamma($x.Num, $shape.Num, $scale.Num, $log ?? 1 !! 0);
    
}


sub raku_pgamma($q, $shape , :$rate is copy, :$scale is copy, :$lower_tail = True, :$log_p = False) 
    is export {
    if $rate.defined && $scale.defined {
        if abs($rate*$scale - 1) < 1e-15 {
            warn("Warning:\n\tspecify 'rate' or 'scale' but not both")
        }
        else {
            die "specify 'rate' or 'scale' but not both"
        }
    } 
    $rate //= 1;
    $scale //= 1/$rate;
    return pgamma($q.Num, $shape.Num, $scale.Num, $lower_tail ?? 1 !! 0,  $log_p ?? 1 !! 0);
    
}


sub raku_qgamma($p, $shape , :$rate is copy, :$scale is copy, :$lower_tail = True, :$log_p = False) 
    is export {
    if $rate.defined && $scale.defined {
        if abs($rate*$scale - 1) < 1e-15 {
            warn("Warning:\n\tspecify 'rate' or 'scale' but not both")
        }
        else {
            die "specify 'rate' or 'scale' but not both"
        }
    } 
    $rate //= 1;
    $scale //= 1/$rate;
    return qgamma($p.Num, $shape.Num, $scale.Num, $lower_tail ?? 1 !! 0,  $log_p ?? 1 !! 0);
    
}



sub raku_rgamma($n, $shape , :$rate is copy, :$scale is copy) 
    is export {
    if $rate.defined && $scale.defined {
        if abs($rate*$scale - 1) < 1e-15 {
            warn("Warning:\n\tspecify 'rate' or 'scale' but not both")
        }
        else {
            die "specify 'rate' or 'scale' but not both"
        }
    } 
    $rate //= 1;
    $scale //= 1/$rate;
    (1..$n).map: {rgamma($shape.Num, $scale.Num)}
}



####	Beta distribution	####
# dbeta(x, shape1, shape2, ncp = 0, log = FALSE)
# pbeta(q, shape1, shape2, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qbeta(p, shape1, shape2, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rbeta(n, shape1, shape2, ncp = 0)


sub raku_dbeta($x, $shape1, $shape2, :$ncp is copy, :$log = False)
    is export {
        if !$ncp.defined {
            return dbeta($x.Num, $shape1.Num, $shape2.Num, $log ?? 1 !! 0)
        } else {
            $ncp //= 0;
            return dnbeta($x.Num, $shape1.Num, $shape2.Num, $ncp.Num, $log ?? 1 !! 0)
        }
    }



sub raku_pbeta($q, $shape1, $shape2, :$ncp is copy, :$lower_tail = True, :$log_p = False)
    is export {
        if !$ncp.defined {
            return pbeta($q.Num, $shape1.Num, $shape2.Num, $lower_tail ?? 1 !! 0 ,$log_p ?? 1 !! 0)
        } else {
            $ncp //= 0;
            return pnbeta($q.Num, $shape1.Num, $shape2.Num, $ncp.Num, $lower_tail ?? 1 !! 0 ,$log_p ?? 1 !! 0)
        }
    }



sub raku_qbeta($p, $shape1, $shape2, :$ncp is copy, :$lower_tail = True, :$log_p = False)
    is export {
        if !$ncp.defined {
            return qbeta($p.Num, $shape1.Num, $shape2.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else {
            $ncp //= 0;
            return qnbeta($p.Num, $shape1.Num, $shape2.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }

    }


# needs raku_chisq function
sub raku_rbeta($n, $shape1, $shape2, :$ncp is copy)
    is export {
        if !$ncp.defined {
            return (1..$n).map: {rbeta($shape1.Num, $shape2.Num)}
        } else {
            $ncp //= 0;
            my $x = raku_rchisq($n, 2 * $shape1, ncp => $ncp);
            $x/($x + raku_rchisq($n, 2 * $shape2))
        }
    }

####	Lognormal distribution	####

# dlnorm(x, meanlog = 0, sdlog = 1, log = FALSE)
# plnorm(q, meanlog = 0, sdlog = 1, lower.tail = TRUE, log.p = FALSE)
# qlnorm(p, meanlog = 0, sdlog = 1, lower.tail = TRUE, log.p = FALSE)
# rlnorm(n, meanlog = 0, sdlog = 1)

sub raku_dlnorm($x, :$meanlog = 0, :$sdlog = 1, :$log = False)
    is export {
        dlnorm($x.Num, $meanlog.Num, $sdlog.Num, $log ?? 1 !! 0)
    }

sub raku_plnorm($q, :$meanlog = 0, :$sdlog = 1, :$lower_tail = True, :$log_p = False)
    is export {
        plnorm($q.Num, $meanlog.Num, $sdlog.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }

sub raku_qlnorm($p, :$meanlog = 0, :$sdlog = 1, :$lower_tail = True, :$log_p = False)
    is export {
        qlnorm($p.Num, $meanlog.Num, $sdlog.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }

sub raku_rlnorm($n, :$meanlog = 0, :$sdlog = 1)
    is export {
        (1..$n).map: {rlnorm($meanlog.Num, $sdlog.Num)}
    }


####	Chi-squared distribution	####


sub raku_dchisq($x, $df, :$ncp is copy, :$log = False) is export { 
    if !$ncp.defined {
        dchisq($x.Num, $df.Num, $log ?? 1 !! 0 )
    } else {
        $ncp //= 0;
        return dnchisq($x.Num, $df.Num, $ncp.Num, $log ?? 1 !! 0 )
    }
}

sub raku_pchisq($q, $df, :$ncp is copy, :$lower_tail = True, :$log_p = False) is export { 
    if !$ncp.defined {
        pchisq($q.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )
    } else {
        $ncp //= 0;
        return pnchisq($q.Num, $df.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )
    }
}

sub raku_qchisq($p, $df, :$ncp is copy, :$lower_tail = True, :$log_p = False) is export { 
    if !$ncp.defined {
        qchisq($p.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )
    } else {
        $ncp //= 0;
        return qnchisq($p.Num, $df.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0 )
    }
 }

sub raku_rchisq($n, $df, :$ncp is copy) is export { 
    if !$ncp.defined {
        return (1..$n).map: {rchisq($df.Num)}
    } else {
        $ncp //= 0;
        return (1..$n).map: {rnchisq($df.Num, $ncp.Num)}
    }
}


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
