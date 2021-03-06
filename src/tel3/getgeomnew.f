      SUBROUTINE getGEOM(GFACT,PP0,H,VP00,ir0,ip)
      parameter(dh1=20.0, ndep1=145, dh=4.0, nddh=5)
*  <<  DELTA VERSUS IH CURVE  >>
      IMPLICIT REAL*8 (A-C)
      IMPLICIT REAL*8 (E-H)
      IMPLICIT REAL*8 (O-Z)
      DIMENSION DELTA(500),V(1000),Q(200),R(1000)
      DIMENSION VV(200),TIH(500),GFACT(*),PP0(*),vs(200)

      data vv/5.80000, 6.50000, 8.04118, 8.04353, 8.04588, 8.04823, 
     +8.06389, 8.11945, 8.17500, 8.23056, 8.28612, 8.35475, 
     +8.42775, 8.50075, 8.57375, 8.64675, 8.71975, 8.79275, 
     +8.86575, 8.93875, 9.01175, 9.41040, 9.47760, 9.54480, 
     +9.61200, 9.67920, 9.74640, 9.81360, 9.88080, 9.94800, 
     +10.01520, 10.08240, 10.14960, 10.80329, 10.85645, 10.90961, 
     +10.96277, 11.01593, 11.06484, 11.10063, 11.13607, 11.17116, 
     +11.20591, 11.24032, 11.27439, 11.30813, 11.34154, 11.37464, 
     +11.40742, 11.43989, 11.47205, 11.50392, 11.53549, 11.56676, 
     +11.59776, 11.62847, 11.65891, 11.68907, 11.71897, 11.74861, 
     +11.77800, 11.80713, 11.83601, 11.86466, 11.89307, 11.92125, 
     +11.94920, 11.97693, 12.00444, 12.03174, 12.05884, 12.08573, 
     +12.11243, 12.13894, 12.16526, 12.19139, 12.21736, 12.24314, 
     +12.26876, 12.29422, 12.31953, 12.34468, 12.36968, 12.39454, 
     +12.41926, 12.44385, 12.46831, 12.49266, 12.51688, 12.54099, 
     +12.56499, 12.58889, 12.61269, 12.63640, 12.66002, 12.68356, 
     +12.70702, 12.73041, 12.75373, 12.77698, 12.80018, 12.82332, 
     +12.84641, 12.86947, 12.89248, 12.91546, 12.93841, 12.96134, 
     +12.98424, 13.00714, 13.03002, 13.05290, 13.07578, 13.09867, 
     +13.12157, 13.14448, 13.16742, 13.19038, 13.21337, 13.23640, 
     +13.25946, 13.28257, 13.30574, 13.32896, 13.35223, 13.37558, 
     +13.39899, 13.42248, 13.44604, 13.46970, 13.49344, 13.51728, 
     +13.54121, 13.56526, 13.58941, 13.61367, 13.63806, 13.65756, 
     +13.66217, 13.66679, 13.67141, 13.67603, 13.68064, 13.68526, 
     +13.68988,  55*0.0/
      data vs/3.36000, 3.75000, 4.47353, 4.48059, 4.48765, 4.49471, 
     + 4.50100, 4.50500, 4.50900, 4.51300, 4.51700, 4.54810, 
     + 4.58290, 4.61770, 4.65250, 4.68730, 4.72210, 4.75690, 
     + 4.79170, 4.82650, 4.86130, 5.10180, 5.14420, 5.18660, 
     + 5.22900, 5.27140, 5.31380, 5.35620, 5.39860, 5.44100, 
     + 5.48340, 5.52580, 5.56820, 5.96297, 6.01487, 6.06676, 
     + 6.11866, 6.17056, 6.21337, 6.22876, 6.24397, 6.25900, 
     + 6.27385, 6.28853, 6.30304, 6.31738, 6.33155, 6.34556, 
     + 6.35941, 6.37310, 6.38664, 6.40002, 6.41326, 6.42634, 
     + 6.43928, 6.45208, 6.46474, 6.47726, 6.48965, 6.50191, 
     + 6.51404, 6.52604, 6.53791, 6.54967, 6.56130, 6.57282, 
     + 6.58423, 6.59553, 6.60672, 6.61780, 6.62878, 6.63966, 
     + 6.65044, 6.66112, 6.67172, 6.68222, 6.69264, 6.70297, 
     + 6.71322, 6.72339, 6.73348, 6.74350, 6.75345, 6.76333, 
     + 6.77314, 6.78289, 6.79258, 6.80221, 6.81179, 6.82131, 
     + 6.83078, 6.84020, 6.84958, 6.85891, 6.86820, 6.87746, 
     + 6.88668, 6.89587, 6.90503, 6.91416, 6.92327, 6.93236, 
     + 6.94142, 6.95047, 6.95951, 6.96854, 6.97755, 6.98656, 
     + 6.99557, 7.00458, 7.01358, 7.02260, 7.03162, 7.04064, 
     + 7.04969, 7.05874, 7.06782, 7.07691, 7.08603, 7.09517, 
     + 7.10434, 7.11354, 7.12277, 7.13204, 7.14135, 7.15070, 
     + 7.16009, 7.16953, 7.17902, 7.18856, 7.19815, 7.20780, 
     + 7.21751, 7.22728, 7.23712, 7.24702, 7.25700, 7.26574, 
     + 7.27071, 7.27568, 7.28064, 7.28561, 7.29058, 7.29554, 
     + 7.30051, 55*0.0/
      data q/600.0, 600.0, 400.0, 80.0, 90., 100., 120., 150.,
     +200., 200., 200., 200., 200., 200., 200., 200.,
     +200., 200., 200., 200., 200., 200., 200., 200.,
     +200., 200., 200., 200., 200., 200., 250., 250.,
     +250., 250., 250., 250., 250., 250., 250., 250.,
     +300., 300., 300., 300., 300., 3000., 3000., 3000.,
     +3000., 3000., 6000., 6000., 6000., 6000., 6000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +10000., 10000., 10000., 10000., 10000., 10000., 10000., 10000.,
     +2000., 2000., 2000., 2000., 2000., 200., 200., 200.,
     +200., 200., 200., 200., 200., 200., 200., 200.,
     +100., 100., 100., 100., 100., 100., 100., 100.,
     +60., 60., 54*0.0/

      NDEP=NDDH*(NDEP1-1)
      DO 11 I=2,NDEP1
         DO 11 J=1,NDDH
            IJ=NDDH*(I-2)+J
	    if(ip.eq.1) then
              V(IJ)=VV(I-1)+(VV(I)-VV(I-1))/DH1*DH*FLOAT(J)
	    else
              V(IJ)=Vs(I-1)+(Vs(I)-Vs(I-1))/DH1*DH*FLOAT(J)
	    endif
   11 CONTINUE
C
      RAD=3.1415926/180.
      L=H/DH+1.
      VP00=V(L)
      ir=1

*  Moho-to-Moho ray-path
      if(ir0.eq.1) then
         L=11
	 ir=L
      endif

      R0=6370.
      RH=R0-H
      DO 9 I=1,NDEP
    9    R(I)=R0-DH*FLOAT(I)
C
      DO 100 J=1,180
         TH=RAD*FLOAT(J)*0.5
         P=RH*SIN(TH)/V(L)
         PA=P*V(NDEP)/R(NDEP)
         DEL=0.
         IF(PA.GT.1.) THEN
            R1=RH
            R2=R(L)
            I=L
   10       PA=P*V(I)/R1
            IF(PA.GE.1.) GOTO 20
            DEL1=DASIN(PA)
            PA=P*V(I)/R2
            IF(PA.GE.1.) THEN
               DEL2=3.141593/2.
               DEL=DEL+DEL2-DEL1
               GOTO 20
            ELSE
               DEL2=DASIN(PA)
               DEL=DEL+DEL2-DEL1
               R1=R(I)
               I=I+1
               R2=R(I)
               GOTO 10
            END IF
   20       DEL=DEL*2.
            R2=RH
            I=L-1
            IF(I.EQ.ir-1) GOTO 30
            R1=R(I)
   25       DEL1=DASIN(P*V(I)/R1)
            DEL2=DASIN(P*V(I)/R2)
            DEL=DEL+DEL2-DEL1
            R2=R1
            I=I-1
            IF(I.EQ.ir-1) GOTO 30
            R1=R(I)
            GOTO 25
   30       DEL=DEL+DASIN(P*V(ir)/R0)-DASIN(P*V(ir)/R2)
         else
   90       DEL=3.141593
	 endif
  100 DELTA(J)=DEL
C
      DO 200 J= 5,125
         DEL=RAD*FLOAT(J)
         I=1
  110    CONTINUE
         IF(DEL.GT.DELTA(I)) THEN
            M=I-1
            GOTO 120
         ELSE
            I=I+1
            GOTO 110
         END IF
  120    TIH(J)=M+(DELTA(M)-DEL)/(DELTA(M)-DELTA(M+1))
         TIH(J)=TIH(J)*0.5
  200 CONTINUE
      DO 300 J=20,115
C        DTIH=(2.*TIH(J-4)+TIH(J-2)-TIH(J+2)-2.*TIH(J+4))/20.
         DTIH=0.
         DO 301 KK=-15,15
  301    DTIH=DTIH+KK*TIH(J-KK)
         DTIH=DTIH/2480
         SH=SIN(TIH(J)*RAD)
         PP0(J)=SH/V(L)
         PP=V(ir)*PP0(J)
         CS0=SQRT(1.-PP*PP)
         SDEL=SIN(FLOAT(J)*RAD)
         GG=V(L)*SH*DTIH/V(ir)/SDEL/CS0
C        G=SQRT(GG)/R0*1.E5
  300    GFACT(J)=SQRT(GG)/R0*1.E5
      END
