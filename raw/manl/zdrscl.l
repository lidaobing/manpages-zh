.TH ZDRSCL l "15 June 2000" "LAPACK version 3.0" ")"
.SH NAME
ZDRSCL - multiplie an n-element complex vector x by the real scalar 1/a
.SH SYNOPSIS
.TP 19
SUBROUTINE ZDRSCL(
N, SA, SX, INCX )
.TP 19
.ti +4
INTEGER
INCX, N
.TP 19
.ti +4
DOUBLE
PRECISION SA
.TP 19
.ti +4
COMPLEX*16
SX( * )
.SH PURPOSE
ZDRSCL multiplies an n-element complex vector x by the real scalar 1/a. This is done without overflow or underflow as long as the final result x/a does not overflow or underflow.
.br

.SH ARGUMENTS
.TP 8
N       (input) INTEGER
The number of components of the vector x.
.TP 8
SA      (input) DOUBLE PRECISION
The scalar a which is used to divide each component of x.
SA must be >= 0, or the subroutine will divide by zero.
.TP 8
SX      (input/output) COMPLEX*16 array, dimension
(1+(N-1)*abs(INCX))
The n-element vector x.
.TP 8
INCX    (input) INTEGER
The increment between successive values of the vector SX.
> 0:  SX(1) = X(1) and SX(1+(i-1)*INCX) = x(i),     1< i<= n
