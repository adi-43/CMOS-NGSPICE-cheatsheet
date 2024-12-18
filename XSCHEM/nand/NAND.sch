v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 160 -20 160 10 {lab=#net1}
N 160 -20 320 -20 {lab=#net1}
N 320 -20 320 10 {lab=#net1}
N 160 70 160 90 {lab=VOUT}
N 320 70 320 90 {lab=VOUT}
N 240 90 240 120 {lab=VOUT}
N 160 90 320 90 {lab=VOUT}
N 240 180 240 200 {lab=#net2}
N 240 260 240 280 {lab=GND}
N 320 90 340 90 {lab=VOUT}
N 100 40 120 40 {lab=A_in}
N 100 40 100 150 {lab=A_in}
N 100 150 200 150 {lab=A_in}
N 280 -40 280 40 {lab=B_in}
N 60 -40 280 -40 {lab=B_in}
N 60 -40 60 230 {lab=B_in}
N 60 230 200 230 {lab=B_in}
N 120 -150 220 -150 {lab=#net1}
N 220 -150 220 -20 {lab=#net1}
N -160 20 -160 40 {lab=B_in}
N -160 20 60 20 {lab=B_in}
N -160 160 -160 180 {lab=A_in}
N -160 140 -160 160 {lab=A_in}
N -160 140 100 140 {lab=A_in}
C {sky130_fd_pr/nfet3_01v8.sym} 220 230 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 220 150 0 0 {name=M2
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
C {sky130_fd_pr/pfet3_01v8.sym} 300 40 0 0 {name=M3
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
C {sky130_fd_pr/pfet3_01v8.sym} 140 40 0 0 {name=M4
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
C {gnd.sym} 240 280 0 0 {name=l1 lab=GND}
C {vsource.sym} 120 -120 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -160 240 0 0 {name=l2 lab=GND}
C {gnd.sym} -160 100 0 0 {name=l3 lab=GND}
C {gnd.sym} 120 -90 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -160 20 0 0 {name=p1 sig_type=std_logic lab=B_in}
C {lab_pin.sym} -160 140 0 0 {name=p2 sig_type=std_logic lab=A_in}
C {opin.sym} 340 90 0 0 {name=p3 lab=VOUT}
C {code_shown.sym} -250 -220 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 0.1n 200n
.save all
.end "}
C {vsource.sym} -160 70 0 0 {name=V1 value="pulse (0 1.8 1ns 1ns 1ns 20ns 40ns)" savecurrent=false}
C {vsource.sym} -160 210 0 0 {name=V2 value="pulse (0 1.8 1ns 1ns 1ns 10ns 20ns)" savecurrent=false}
