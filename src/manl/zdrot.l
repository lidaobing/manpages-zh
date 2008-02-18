.TH ZDROT 3
.SH NAME
ZDROT \- ZDROT
.SH "总览 SYNOPSIS"
.TP 18
SUBROUTINE ZDROT(
N, CX, INCX, CY, INCY, C, S )
.TP 18
.ti +4
INTEGER
INCX, INCY, N
.TP 18
.ti +4
DOUBLE
PRECISION C, S
.TP 18
.ti +4
COMPLEX*16
CX( * ), CY( * )
.TP 18
.ti +4
INTEGER
I, IX, IY
.TP 18
.ti +4
COMPLEX*16
CTEMP
.TP 18
.ti +4
IF(
N.LE.0 )
RETURN
.TP 18
.ti +4
IF(
INCX.EQ.1 .AND. INCY.EQ.1 )
GO TO 20
.TP 18
.ti +4
IX
= 1
.TP 18
.ti +4
IY
= 1
.TP 18
.ti +4
IF(
INCX.LT.0 )
IX = ( -N+1 )*INCX + 1
.TP 18
.ti +4
IF(
INCY.LT.0 )
IY = ( -N+1 )*INCY + 1
.TP 18
.ti +4
DO
10 I = 1, N
.TP 18
.ti +4
CTEMP
= C*CX( IX ) + S*CY( IY )
.TP 18
.ti +4
CY(
IY ) = C*CY( IY ) - S*CX( IX )
.TP 18
.ti +4
CX(
IX ) = CTEMP
.TP 18
.ti +4
IX
= IX + INCX
.TP 18
.ti +4
IY
= IY + INCY
.TP 18
.ti +4
10
CONTINUE
.TP 18
.ti +4
RETURN
.TP 18
.ti +4
20
CONTINUE
.TP 18
.ti +4
DO
30 I = 1, N
.TP 18
.ti +4
CTEMP
= C*CX( I ) + S*CY( I )
.TP 18
.ti +4
CY(
I ) = C*CY( I ) - S*CX( I )
.TP 18
.ti +4
CX(
I ) = CTEMP
.TP 18
.ti +4
30
CONTINUE
.TP 18
.ti +4
RETURN
.TP 18
.ti +4
END
.SH PURPOSE

.SH "[中文版维护人]"
.B 姓名 <email>
.SH "[中文版最新更新]"
.B yyyy.mm.dd
.SH "《中国linux论坛man手册页翻译计划》:"
.BI http://cmpp.linuxforum.net 
