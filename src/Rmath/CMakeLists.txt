cmake_minimum_required(VERSION 3.10)
project(Rmath VERSION 4.3.1 LANGUAGES C DESCRIPTION "Rmath shared standalone library of R")

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# /nologo /MT /std:c++latest /Ox /GL /DNDEBUG  /DWIN32 /DAO_ASSUME_WINDOWS98 -DMVM_HEAPSNAPSHOT_FORMAT=2 -D_GNU_SOURCE in MSVC
# but did not work with MSVC


##################################################
# Create target and set properties
##################################################

set(CMAKE_BUILD_TYPE Release)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/R_ext)


# bad practice, comment out
# file(GLOB SOURCES "src/*.c" "src/standalone/*.c")
# specify all C files by names
# see here: https://stackoverflow.com/a/18538444/2774153


# generate shared library
# currently it gets built only with gcc
add_library(Rmath SHARED
            src/bd0.c        src/dlogis.c      src/i1mach.c     
            src/bessel_i.c   src/dnbeta.c      src/imax2.c      
            src/bessel_j.c   src/dnbinom.c     src/imin2.c      
            src/bessel_k.c   src/dnchisq.c     src/lbeta.c      
            src/bessel_y.c   src/dnf.c         src/lgamma.c     
            src/beta.c       src/dnorm.c       src/lgammacor.c  
            src/chebyshev.c  src/dnt.c         src/log1p.c      
            src/choose.c     src/dpois.c       src/mlutils.c    
            src/cospi.c      src/dt.c          src/pbeta.c      
            src/d1mach.c     src/dunif.c       src/pbinom.c     
            src/dbeta.c      src/dweibull.c    src/pcauchy.c    
            src/dbinom.c     src/fmax2.c       src/pchisq.c     
            src/dcauchy.c    src/fmin2.c       src/pexp.c       
            src/dchisq.c     src/fprec.c       src/pf.c         
            src/dexp.c       src/fround.c      src/pgamma.c     
            src/df.c         src/fsign.c       src/pgeom.c      
            src/dgamma.c     src/ftrunc.c      src/phyper.c     
            src/dgeom.c      src/gamma.c       src/plnorm.c     
            src/dhyper.c     src/gamma_cody.c  src/plogis.c     
            src/dlnorm.c     src/gammalims.c   src/pnbeta.c  
            src/pnbinom.c    src/qlnorm.c      src/rgamma.c
            src/pnchisq.c    src/qlogis.c      src/rgeom.c
            src/pnf.c        src/qnbeta.c      src/rhyper.c
            src/pnorm.c      src/qnbinom.c     src/rlnorm.c
            src/pnt.c        src/qnbinom_mu.c  src/rlogis.c
            src/polygamma.c  src/qnchisq.c     src/rmultinom.c
            src/ppois.c      src/qnf.c         src/rnbinom.c
            src/pt.c         src/qnorm.c       src/rnchisq.c
            src/ptukey.c     src/qnt.c         src/rnorm.c
            src/punif.c      src/qpois.c       src/rpois.c
            src/pweibull.c   src/qt.c          src/rt.c
            src/qbeta.c      src/qtukey.c      src/runif.c
            src/qbinom.c     src/qunif.c       src/rweibull.c
            src/qcauchy.c    src/qweibull.c    src/sexp.c
            src/qchisq.c     src/rbeta.c       src/sign.c
            src/qexp.c       src/rbinom.c      src/signrank.c
            src/qf.c         src/rcauchy.c     src/snorm.c
            src/qgamma.c     src/rchisq.c      src/stirlerr.c
            src/qgeom.c      src/rexp.c        src/toms708.c
            src/qhyper.c     src/rf.c          src/wilcox.c   
            src/standalone/sunif.c)


##======================================================##    
# without this, cmake generates libRmath.dll        
if (WIN32)
  set_target_properties(Rmath PROPERTIES PREFIX "")
endif()
##======================================================##

##======================================================##
# Generate makefiles compatible with GCC in windows with
# mkdir build && cd build && 
#              cmake .. -G "MinGW Makefiles" and then run 
#              make

# Generate Ninja build files with mkdir build && cd build && 
#              cmake .. -GNinja and after that run ninja

# also possible to generate MSYS Makefiles in Rtools chain 4.2
##======================================================##