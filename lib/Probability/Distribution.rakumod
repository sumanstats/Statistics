#======================================================#
# Author: Dr Suman Khanal
# Date creation: Monday Oct 09 2023, 20:39:32
# ~: Probability Distribution module
# File: Distribution.rakumod
#======================================================#


unit module Probability::Distribution;

use NativeCall;
constant RMATH = %?RESOURCES<libraries/Rmath>;



# Please note: In **windows** supply libraries/libRmath, not Rmath only, 
#              tested in Windows 10
#              However in **Linux** supply libraries/Rmath

# Also in resources field in META6.json in windows, put "libraries/libRmath"
# In Linux put "libraries/Rmath"

# In windows I use msys2 shell from Rtools42, which has **make** available
# Add **gcc and make from Rtool42 in your path** before installing this module.

# Better to avoid using **make** because it has so many different names 
# (make, mingw32-make, gmake, nmake), not consistent 

# Best would be to rather use **ninja** 


####    Function signatures     ####


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

sub rmultinom(int32, CArray[num64], int32, CArray[int32])
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


sub dnbinom_mu(num64, num64, num64, int32) returns num64
    is native( RMATH ) { * };
sub pnbinom_mu(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };
sub qnbinom_mu(num64, num64, num64, int32, int32) returns num64
    is native( RMATH ) { * };
sub rnbinom_mu(num64, num64) returns num64
    is native( RMATH ) { * };




#	/* Poisson Distribution */

sub dpois(num64, num64, int32) returns num64
    is native( RMATH ) { * };
sub ppois(num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub qpois(num64, num64, int32, int32) returns num64 
    is native( RMATH ) { * };
sub rpois(num64) returns num64 
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
sub wilcox_free()
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
sub signrank_free()
    is native( RMATH ) { * };

#	/* Gamma and Related Functions */

sub gammafn(num64) returns num64
    is native( RMATH ) { * }; # gamma in R
sub lgammafn(num64) returns num64 
    is native( RMATH ) { * }; # lgamma in R
multi psigamma(num64, num64) returns num64 
    is native( RMATH ) { * };
multi digamma(num64) returns num64 
    is native( RMATH ) { * };
multi trigamma(num64) returns num64 
    is native( RMATH ) { * };



multi beta(num64, num64) returns num64 
    is native( RMATH ) { * };
multi lbeta(num64, num64) returns num64 
    is native( RMATH ) { * };
multi choose(num64, num64) returns num64 
    is native( RMATH ) { * };
multi lchoose(num64, num64) returns num64 
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

multi set_seed(uint32, uint32)
    is native( RMATH ) { * };

sub get_seed(uint32 is rw, uint32 is rw)
    is native( RMATH ) { * };

multi set_seed(UInt() $a, UInt() $b) is export {
    # Don't give negative parameters
    # Tolerates Num though, as it converts to UInt
    set_seed(my uint32 $ = $a, my uint32 $ = $b)
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
    dunif($x.Num, $min.Num, $max.Num, $log ?? 1 !! 0);
}

sub raku_punif($q, :$min = 0 , :$max = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    punif($q.Num, $min.Num, $max.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
}

sub raku_qunif($p, :$min = 0 , :$max = 1, :$lower_tail = True, :$log_p = False) 
    is export {
    qunif($p.Num, $min.Num, $max.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);

}

sub raku_runif($n, :$min = 0 , :$max = 1) 
    is export {
    (1..$n).map: {runif($min.Num, $max.Num)};
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

# dchisq(x, df, ncp = 0, log = FALSE)
# pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rchisq(n, df, ncp = 0)

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


####	F Distribution	####

# df(x, df1, df2, ncp, log = FALSE)
# pf(q, df1, df2, ncp, lower.tail = TRUE, log.p = FALSE)
# qf(p, df1, df2, ncp, lower.tail = TRUE, log.p = FALSE)
# rf(n, df1, df2, ncp)


sub raku_df($x!, $df1!, $df2!, $ncp?, :$log = False) 
    is export {
        with $ncp {
            return dnf($x.Num, $df1.Num, $df2.Num, $ncp.Num, $log ?? 1 !! 0)
        } else {
            return df($x.Num, $df1.Num, $df2.Num, $log ?? 1 !! 0)
        }
    }


sub raku_pf($q!, $df1!, $df2!, $ncp?, :$lower_tail = True, :$log_p = False) 
    is export {
        with $ncp {
            return pnf($q.Num, $df1.Num, $df2.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else {
            return pf($q.Num, $df1.Num, $df2.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }
    }


sub raku_qf($p!, $df1!, $df2!, $ncp?, :$lower_tail = True, :$log_p = False) 
    is export {
        with $ncp {
            return qnf($p.Num, $df1.Num, $df2.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else {
            return qf($p.Num, $df1.Num, $df2.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }
    }


sub raku_rf($n, $df1!, $df2!, $ncp?) 
    is export {
        with $ncp {
            return (1..$n).map: {(rnchisq($df1.Num, $ncp.Num)/$df1)/(rchisq($df2.Num)/$df2)}
        } else {
            return (1..$n).map: {rf($df1.Num, $df2.Num)}
        }
    }



####	Student t distribution	####

# dt(x, df, ncp, log = FALSE)
# pt(q, df, ncp, lower.tail = TRUE, log.p = FALSE)
# qt(p, df, ncp, lower.tail = TRUE, log.p = FALSE)
# rt(n, df, ncp)

sub raku_dt($x!, $df!, $ncp?, :$log = False) 
    is export {
        with $ncp {
            dnt($x.Num, $df.Num, $ncp.Num, $log ?? 1 !! 0)
        } else {
            dt($x.Num, $df.Num, $log ?? 1 !! 0)
        }
    }


sub raku_pt($q!, $df!, $ncp?, :$lower_tail = True, :$log_p = False) 
    is export {
        with $ncp {
            pnt($q.Num, $df.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else{
            pt($q.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }
    }



sub raku_qt($p!, $df!, $ncp?, :$lower_tail = True, :$log_p = False) 
    is export {
        with $ncp {
            qnt($p.Num, $df.Num, $ncp.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else{
            qt($p.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }
    }



sub raku_rt($n, $df, $ncp?) 
    is export {
        with $ncp {
            (1..$n).map: {rnorm($ncp.Num, 1.Num)/sqrt(rchisq($df.Num)/$df)}
        } else {
            (1..$n).map: {rt($df.Num)}
        }
    }


####	Binomial distribution	####

# dbinom(x, size, prob, log = FALSE)
# pbinom(q, size, prob, lower.tail = TRUE, log.p = FALSE)
# qbinom(p, size, prob, lower.tail = TRUE, log.p = FALSE)
# rbinom(n, size, prob)


sub raku_dbinom($x!, $size!, $prob!, :$log = False)
    is export {
        dbinom($x.Num, $size.Num, $prob.Num, $log ?? 1 !! 0)
    }


sub raku_pbinom($q!, $size!, $prob!, :$lower_tail = True, :$log_p = False)
    is export {
        pbinom($q.Num, $size.Num, $prob.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_qbinom($p, $size, $prob, :$lower_tail = True, :$log_p = False)
    is export {
        qbinom($p.Num, $size.Num, $prob.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_rbinom($n!, $size!, $prob!)
    is export {
        (1..$n).map: {rbinom($size.Num, $prob.Num)}
    }

#===========================================================
#===========================================================
####	Multinomial distribution	####

# TODO

# https://stackoverflow.com/questions/63368639/how-to-use-multinomial-function-in-c-with-rmath-h

sub raku_rmultinom($n , $size, @prob is copy) is export {
    @prob = @prob.map: {$_.Num};
    my $prob = CArray[num64].new(@prob);
    my $ints = CArray[int32].allocate($size);
    rmultinom(100, $prob, $size, $ints);
    return $ints.list
}

# sub raku_dmultinom($x, $size = NULL, $prob, $log = False)
#     is export {

#     }


####	Cauchy distribution	####

# dcauchy(x, location = 0, scale = 1, log = FALSE)
# pcauchy(q, location = 0, scale = 1, lower.tail = TRUE, log.p = FALSE)
# qcauchy(p, location = 0, scale = 1, lower.tail = TRUE, log.p = FALSE)
# rcauchy(n, location = 0, scale = 1)

sub raku_dcauchy($x, $location = 0, $scale = 1, :$log = False)
    is export {
        dcauchy($x.Num, $location.Num, $scale.Num, $log ?? 1 !! 0);
    }


sub raku_pcauchy($q, $location = 0, $scale = 1, :$lower_tail = True, :$log_p = False)
    is export {
        pcauchy($q.Num, $location.Num, $scale.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }



sub raku_qcauchy($p, $location = 0, $scale = 1, :$lower_tail = True, :$log_p = False)
    is export {
        qcauchy($p.Num, $location.Num, $scale.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }


sub raku_rcauchy($n, $location = 0, $scale = 1)
    is export {
        (1..$n).map: {rcauchy($location.Num, $scale.Num)}
    }

####	Exponential distribution	####

# dexp(x, rate = 1, log = FALSE)
# pexp(q, rate = 1, lower.tail = TRUE, log.p = FALSE)
# qexp(p, rate = 1, lower.tail = TRUE, log.p = FALSE)
# rexp(n, rate = 1)

sub raku_dexp($x!, $rate = 1, :$log = False)
    is export {
        dexp($x.Num, (1/$rate).Num, $log ?? 1 !! 0 )
    }


sub raku_pexp($q, $rate = 1, :$lower_tail = True, :$log_p = False)
    is export {
        pexp($q.Num, (1/$rate).Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }

sub raku_qexp($p, $rate = 1, :$lower_tail = True, :$log_p = False)
    is export {
        qexp($p.Num, (1/$rate).Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_rexp($n, $rate = 1)
    is export {
        (1..$n).map: {rexp((1/$rate).Num)}
    }

####	Geometric distribution	####

# dgeom(x, prob, log = FALSE)
# pgeom(q, prob, lower.tail = TRUE, log.p = FALSE)
# qgeom(p, prob, lower.tail = TRUE, log.p = FALSE)
# rgeom(n, prob)

sub raku_dgeom($x!, $prob!, :$log = False)
    is export {
        dgeom($x.Num, $prob.Num, $log ?? 1 !! 0);
    }

sub raku_pgeom($q!, $prob!, :$lower_tail = True, :$log_p = False)
    is export {
        pgeom($q.Num, $prob.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }

sub raku_qgeom($p!, $prob!, :$lower_tail = True, :$log_p = False)
    is export {
        qgeom($p.Num, $prob.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }

sub raku_rgeom($n!, $prob!)
    is export {
        (1..$n).map: {rgeom($prob.Num)}
    }

####	Hypergeometric distribution	####

# dhyper(x, m, n, k, log = FALSE)
# phyper(q, m, n, k, lower.tail = TRUE, log.p = FALSE)
# qhyper(p, m, n, k, lower.tail = TRUE, log.p = FALSE)
# rhyper(nn, m, n, k)

sub raku_dhyper($x!, $m!, $n!, $k!, :$log = False)
    is export {
        dhyper($x.Num, $m.Num, $n.Num, $k.Num, $log ?? 1 !! 0);
    }

 
sub raku_phyper($q!, $m!, $n!, $k!, :$lower_tail = True, :$log_p = False)
    is export {
        phyper($q.Num, $m.Num, $n.Num, $k.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }


sub raku_qhyper($p!, $m!, $n!, $k!, :$lower_tail = True, :$log_p = False)
    is export {
        qhyper($p.Num, $m.Num, $n.Num, $k.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }

 
sub raku_rhyper($nn, $m, $n, $k)
    is export {
        (1..$nn).map: {rhyper($m.Num, $n.Num, $k.Num)}
    }

####	Negative binomial distribution	####

# dnbinom(x, size, prob, mu, log = FALSE)
# pnbinom(q, size, prob, mu, lower.tail = TRUE, log.p = FALSE)
# qnbinom(p, size, prob, mu, lower.tail = TRUE, log.p = FALSE)
# rnbinom(n, size, prob, mu)

sub raku_dnbinom($x, $size, :$prob, :$mu, :$log = False)
    is export {
        if $mu.defined {
            if $prob.defined {
                die("'prob' and 'mu' both specified")
            }
            dnbinom_mu($x.Num, $size.Num, $mu.Num, $log ?? 1 !! 0)
        } else {
            dnbinom($x.Num, $size.Num, $prob.Num, $log ?? 1 !! 0)
        }
    }




sub raku_pnbinom($q, $size, :$prob, :$mu, :$lower_tail = True, :$log_p = False)
    is export {
        if $mu.defined {
            if $prob.defined {
                die("'prob' and 'mu' both specified")
            }
            pnbinom_mu($q.Num, $size.Num, $mu.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else {
            pnbinom($q.Num, $size.Num, $prob.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }
    }





sub raku_qnbinom($p, $size, :$prob, :$mu, :$lower_tail = True, :$log_p = False)
    is export {
        if $mu.defined {
            if $prob.defined {
                die("'prob' and 'mu' both specified")
            }
            qnbinom_mu($p.Num, $size.Num, $mu.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        } else {
            qnbinom($p.Num, $size.Num, $prob.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
        }
    }





sub raku_rnbinom($n, $size, :$prob, :$mu)
    is export {
        if !$prob.defined && !$mu.defined {
            die "Supply atleast \$prob or \$mu"
        }
        if $mu.defined {
            if $prob.defined {
                die("'prob' and 'mu' both specified")
            }
            (1..$n).map: {rnbinom_mu($size.Num, $mu.Num)}
        } else {
            (1..$n).map: {rnbinom($size.Num, $prob.Num)}
        }
    }

####	Poisson distribution	####

# dpois(x, lambda, log = FALSE)
# ppois(q, lambda, lower.tail = TRUE, log.p = FALSE)
# qpois(p, lambda, lower.tail = TRUE, log.p = FALSE)
# rpois(n, lambda)

sub raku_dpois($x, $lambda, :$log = False)
    is export {
        dpois($x.Num, $lambda.Num, $log ?? 1 !! 0)
    }



sub raku_ppois($q, $lambda, :$lower_tail = True, :$log_p = False)
    is export {
        ppois($q.Num, $lambda.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }




sub raku_qpois($p, $lambda, :$lower_tail = True, :$log_p = False)
    is export {
        qpois($p.Num, $lambda.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_rpois($n, $lambda)
    is export {
        (1..$n).map: {rpois($lambda.Num)}
    }

####	Weibull Distribution	####

# dweibull(x, shape, scale = 1, log = FALSE)
# pweibull(q, shape, scale = 1, lower.tail = TRUE, log.p = FALSE)
# qweibull(p, shape, scale = 1, lower.tail = TRUE, log.p = FALSE)
# rweibull(n, shape, scale = 1)

sub raku_dweibull($x, $shape, $scale = 1, :$log = False)
    is export {
        dweibull($x.Num, $shape.Num, $scale.Num, $log ?? 1 !! 0)
    }


sub raku_pweibull($q, $shape, $scale = 1, :$lower_tail = True, :$log_p = False)
    is export {
        pweibull($q.Num, $shape.Num, $scale.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_qweibull($p, $shape, $scale = 1, :$lower_tail = True, :$log_p = False)
    is export {
        qweibull($p.Num, $shape.Num, $scale.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_rweibull($n, $shape, $scale = 1)
    is export {
        (1..$n).map: {rweibull($shape.Num, $scale.Num)}
    }

####	Logistic distribution	####

# dlogis(x, location = 0, scale = 1, log = FALSE)
# plogis(q, location = 0, scale = 1, lower.tail = TRUE, log.p = FALSE)
# qlogis(p, location = 0, scale = 1, lower.tail = TRUE, log.p = FALSE)
# rlogis(n, location = 0, scale = 1)



sub raku_dlogis($x, $location = 0, $scale = 1, :$log = False)
    is export {
        dlogis($x.Num, $location.Num, $scale.Num, $log ?? 1 !! 0)
    }


sub raku_plogis($q, $location = 0, $scale = 1, :$lower_tail = True, :$log_p = False)
    is export {
        plogis($q.Num, $location.Num, $scale.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_qlogis($p, $location = 0, $scale = 1, :$lower_tail = True, :$log_p = False)
    is export {
        qlogis($p.Num, $location.Num, $scale.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)

    }


sub raku_rlogis($n, $location = 0, $scale = 1)
    is export {
        (1..$n).map: {rlogis($location.Num, $scale.Num)}
    }

####	Studentized Range Distribution	####

# ptukey(q, nmeans, df, nranges = 1, lower.tail = TRUE, log.p = FALSE)
# qtukey(p, nmeans, df, nranges = 1, lower.tail = TRUE, log.p = FALSE)

sub raku_ptukey($q, $nmeans, $df, $nranges = 1, :$lower_tail = True, :$log_p = False)
    is export {
        ptukey($q.Num, $nranges.Num, $nmeans.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }


sub raku_qtukey($p, $nmeans, $df, $nranges = 1, :$lower_tail = True, :$log_p = False)
    is export {
        qtukey($p.Num, $nranges.Num, $nmeans.Num, $df.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0)
    }

####	Wilcoxon Rank Sum Distribution	####

# dwilcox(x, m, n, log = FALSE)
# pwilcox(q, m, n, lower.tail = TRUE, log.p = FALSE)
# qwilcox(p, m, n, lower.tail = TRUE, log.p = FALSE)
# rwilcox(nn, m, n)

sub raku_dwilcox($x, $m, $n, :$log = False)
    is export {
        LEAVE { wilcox_free() };
        dwilcox($x.Num, $m.Num, $n.Num, $log ?? 1 !! 0);
    }



sub raku_pwilcox($q, $m, $n, :$lower_tail = True, :$log_p = False)
    is export {
        LEAVE { wilcox_free() };
        pwilcox($q.Num, $m.Num, $n.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }


sub raku_qwilcox($p, $m, $n, :$lower_tail = True, :$log_p = False)
    is export {
        LEAVE { wilcox_free() };
        qwilcox($p.Num, $m.Num, $n.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }


sub raku_rwilcox($nn, $m, $n)
    is export {
        (1..$nn).map: {rwilcox($m.Num, $n.Num)}
    }


####	Wilcoxon Signed Rank Distribution	####

# dsignrank(x, n, log = FALSE)
# psignrank(q, n, lower.tail = TRUE, log.p = FALSE)
# qsignrank(p, n, lower.tail = TRUE, log.p = FALSE)
# rsignrank(nn, n)

sub raku_dsignrank($x, $n, :$log = False)
    is export {
        LEAVE { signrank_free() };
        dsignrank($x.Num, $n.Num, $log ?? 1 !! 0);
    }


sub raku_psignrank($q, $n, :$lower_tail = True, :$log_p = False)
    is export {
        LEAVE { signrank_free() };
        psignrank($q.Num, $n.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }


sub raku_qsignrank($p, $n, :$lower_tail = True, :$log_p = False)
    is export {
        LEAVE { signrank_free() };
        qsignrank($p.Num, $n.Num, $lower_tail ?? 1 !! 0, $log_p ?? 1 !! 0);
    }
 
sub raku_rsignrank($nn, $n)
    is export {
        (1..$nn).map: {rsignrank($n.Num)}
    }


# Other functions

multi beta(Num() $a, Num() $b) is export 
{
    return beta(my num64 $ = $a, my num64 $ = $b)
}

multi lbeta(Num() $a, Num() $b) is export 
{
    return lbeta(my num64 $ = $a, my num64 $ = $b)
}

sub gamma($x) is export 
{
    return gammafn($x.Num)
}

sub lgamma($x) is export 
{
    return lgammafn($x.Num)
}

multi psigamma(Num() $x, Num() $deriv = 0) is export 
{
    return psigamma(my num64 $ = $x, my num64 $ = $deriv)
}

multi digamma(Num() $x) is export 
{
    return digamma(my num64 $ = $x)
}

multi trigamma(Num() $x) is export 
{
    return trigamma(my num64 $ = $x)
}

multi choose(Num() $n, Num() $k) is export 
{
    return choose(my num64 $ = $n, my num64 $ = $k)
}

multi lchoose(Num() $n, Num() $k) is export 
{
    return lchoose(my num64 $ = $n, my num64 $ = $k)
}

sub factorial($x) is export 
{
    gammafn(($x + 1).Num)
}

sub lfactorial($x) is export 
{
    lgammafn(($x + 1).Num)
}


# Similar to excel =MULTINOMIAL()
sub multinomial_coef(+@array_num is copy) is export {
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
