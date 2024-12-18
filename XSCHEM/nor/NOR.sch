v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 -110 -80 -90 {lab=Y_out}
N -80 -110 80 -110 {lab=Y_out}
N 80 -110 80 -90 {lab=Y_out}
N -80 -30 -80 -10 {lab=GND}
N -80 -10 80 -10 {lab=GND}
N 80 -30 80 -10 {lab=GND}
N 0 -150 0 -110 {lab=Y_out}
N 0 -130 120 -130 {lab=Y_out}
N 0 -240 0 -210 {lab=#net1}
N 0 -350 0 -300 {lab=#net2}
N -170 -270 -40 -270 {lab=A_in}
N -170 -270 -170 -60 {lab=A_in}
N -170 -60 -120 -60 {lab=A_in}
N -260 -180 -40 -180 {lab=xxx}
N -260 -180 -260 50 {lab=xxx}
N -260 50 40 50 {lab=xxx}
N 40 -60 40 50 {lab=xxx}
N -0 -10 0 0 {lab=GND}
N -420 -250 -420 -230 {lab=A_in}
N -330 -110 -330 -80 {lab=xxx}
N -330 -110 -260 -110 {lab=xxx}
N -420 -250 -170 -250 {lab=A_in}
C {sky130_fd_pr/nfet3_01v8.sym} -100 -60 0 0 {name=M1
W=1
L=0.15
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 60 -60 0 0 {name=M2
W=1
L=0.15
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -20 -180 0 0 {name=M3
W=1
L=0.15
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -20 -270 0 0 {name=M4
W=1
L=0.15
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {gnd.sym} 0 0 0 0 {name=l1 lab=GND}
C {vsource.sym} -420 -200 0 0 {name=v1 value="pulse (0 1.8 1ns 1ns 1ns 10ns 20ns)" savecurrent=false}
C {vsource.sym} -330 -50 0 0 {name=v2 value="pulse (0 1.8 1ns 1ns 1ns 20ns 40ns)" savecurrent=false}
C {vsource.sym} 0 -380 2 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} 0 -410 2 0 {name=l2 lab=GND}
C {gnd.sym} -420 -170 0 0 {name=l3 lab=GND}
C {gnd.sym} -330 -20 0 0 {name=l4 lab=GND}
C {opin.sym} 120 -130 0 0 {name=p1 lab=Y_out}
C {code_shown.sym} -390 -470 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 0.1n 200n
.save all
.end "}
C {lab_pin.sym} -420 -250 0 0 {name=p2 sig_type=std_logic lab=A_in}
C {lab_pin.sym} -330 -110 0 0 {name=p3 sig_type=std_logic lab=B_in}
