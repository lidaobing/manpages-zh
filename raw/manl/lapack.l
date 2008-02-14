.TH LAPACK l "2 April 1993" "LAPACK Version 1.1" "LAPACK FORTRAN LIBRARY ROUTINES"

.SH WHAT IS LAPACK?
.in -0.3i
LAPACK is a transportable library of Fortran 77 subroutines for
solving the most common problems in numerical linear algebra: systems
of linear equations, linear least squares problems, eigenvalue problems,
and singular value problems. It has been designed to be efficient
on a wide range of modern high-performance computers.

LAPACK is intended to be the successor to LINPACK and EISPACK.
It extends the functionality of these packages by including
equilibration, iterative refinement, error bounds, and driver routines
for linear systems, routines for computing and re-ordering the Schur
factorization, and condition estimation routines for eigenvalue
problems.  LAPACK improves on the accuracy of the standard algorithms
in EISPACK by including high accuracy algorithms for finding singular
values and eigenvalues of bidiagonal and tridiagonal matrices
respectively that arise in SVD and symmetric eigenvalue problems.
The algorithms and software have been restructured to achieve high
efficiency on vector processors, high-performance ``superscalar''
workstations, and shared-memory multiprocessors. 
A comprehensive testing and timing suite is provided along with the
LAPACK software.
 
.SH HOW TO GET LAPACK
.in -0.3i
The entire LAPACK package is available via xnetlib and NAG, or specific
routines can be obtained via netlib.  To see a description of the
contents of LAPACK, send email to netlib@ornl.gov and in the mail
message type: send index from lapack.

Xnetlib is an X-version of netlib recently developed at the University
of Tennessee and Oak Ridge National Laboratory.  Unlike netlib, which
uses electronic mail to process requests for software and other text,
xnetlib uses an X Window graphical user interface and a socket-based
connection between the user's machine and the xnetlib server machine to
process software requests. The complete contents of LAPACK is available
in tar/compress format from xnetlib.

To receive a copy of xnetlib send the message "send xnetlib.shar from
xnetlib" to netlib@ornl.gov.

When you receive the shar file, remove the mail header, save it to a
file, type 'sh filename' and follow the instructions in the README
file.

Alternatively, the complete LAPACK package can be
obtained from NAG on magnetic media for a handling charge. 
For further details contact NAG at one of the following addresses:
 
.nf
NAG Inc	                      NAG Ltd              NAG GmbH
1400 Opus Place               Wilkinson House      Schleissheimerstrasse 5
Suite 200                     Jordan Hill Road     W-8046 Garching bei Munchen
Downers Grove, IL 60515-5702  Oxford OX2 8DR       Germany 
USA                           England
Tel: +1 708 971 2337          Tel: +44 865 511245  Tel: +49 89 3207395
Fax: +1 708 971 2706          Fax: +44 865 310139  Fax: +49 89 3207396
.fi
 
LAPACK has been thoroughly tested, on many different
types of computers.  The LAPACK project supports the package in the
sense that reports of errors or poor performance will gain immediate
attention from the developers. Such reports, descriptions
of interesting applications, and other comments should be sent by
electronic mail to lapack@cs.utk.edu.

.SH LAPACK USERS' GUIDE
.in -0.3i
The LAPACK Users' Guide is published by SIAM and was made available
May, 1992.  LAPACK Users' Guide gives an informal introduction to
the design of the algorithms and software, summarizes the contents
of the package, and describes the conventions used in the software
and documentation, and includes complete specifications for calling
the routines.  The LAPACK Users' Guide can be purchased from:
SIAM; 3600 University City Science Center; Philadelphia, PA 19104-2688;
215-382-9800, FAX 215-386-7999.  It will also be available from
booksellers.  The Guide costs $15.60 for SIAM members, and $19.50
for non-members.  Please specify order code OT31 when ordering.
To order by email, send email to service@siam.org.

A list of known problems, bugs, and compiler errors for LAPACK, as 
well as errata for the LAPACK Users' Guide and the LAPACK code itself, is
maintained on netlib.  For a copy of this report, send email to
netlib@ornl.gov with a message of the form: send release_notes from
lapack.

.SH LAPACK WORKING NOTES
.in -0.3i
A number of working notes were written during the
development of LAPACK and published as LAPACK Working Notes,
initially by Argonne National Laboratory and later by the University
of Tennessee.  Many of these reports have subsequently appeared as
journal articles.  Most of these working notes are available in postscript
form from netlib.  To receive a list of available reports, send email to
netlib@ornl.gov with a message of the form: send index from lapack/lawns.
Otherwise, requests for copies of these working notes can be sent to
the following address.

LAPACK Project
c/o J.J. Dongarra
Computer Science Department
University of Tennessee
Knoxville, Tennessee 37996-1301
USA
Email: lapack@cs.utk.edu
 
.SH ACKNOWLEDGEMENTS
.in -0.3i
LAPACK has been funded in part by NSF, DOE, and DARPA, with
developmental support from NAG Ltd., Cray Research, and many friends
and colleagues around the world.
 

Ed Anderson, Zhao-jun Bai, Chris Bischof, Jim Demmel, Jack Dongarra,
Jeremy Du Croz, Anne Greenbaum, Sven Hammarling, Alan McKenney,
Susan Ostrouchov, and Danny Sorensen
 
             (           l    l    l    l )
             (           a   -a    a   -a )
       1/4 * ( p    p             -p   -p )
             ( a   -a             -a    a )
             ( c    c   -c   -c           )
             ( k   -k   -k    k           )

 
.SH NAMING SCHEME
.in -0.3i
The name of each LAPACK routine is a coded specification of
its function (within the very tight limits of standard Fortran 77
6-character names).
 
All driver and computational routines have names of the form XYYZZZ,
where for some driver routines the 6th character is blank.
 
The first letter, X, indicates the data type as follows:
 
      S  REAL
      D  DOUBLE PRECISION
      C  COMPLEX
      Z  COMPLEX*16  or DOUBLE COMPLEX
 
The next two letters, YY, indicate the type of matrix (or of the most
significant matrix).  Most of these two-letter codes apply to both real
and complex matrices; a few apply specifically to one or the other.
 
The last three letters ZZZ indicate the computation performed.
For example, SGEBRD is a single precision routine that performs a
bidiagonal reduction (BRD) of a real general matrix.
