v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 90 80 150 {lab=VOUT}
N 80 10 80 30 {lab=#net1}
N 80 210 80 240 {lab=GND}
N 80 120 100 120 {lab=VOUT}
N -120 120 -120 190 {lab=VIN}
N -60 10 80 10 {lab=#net1}
N 10 60 40 60 {lab=VIN}
N 10 60 10 180 {lab=VIN}
N 10 180 40 180 {lab=VIN}
N -120 120 10 120 {lab=VIN}
N -60 10 -60 150 {lab=#net1}
N -120 190 -120 230 {lab=VIN}
C {opin.sym} 100 120 0 0 {name=p4 lab=VOUT}
C {vsource.sym} -60 180 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -120 260 0 0 {name=VIN value=0 savecurrent=false}
C {gnd.sym} -120 290 0 0 {name=l1 lab=GND}
C {gnd.sym} -60 210 0 0 {name=l2 lab=GND}
C {code_shown.sym} 210 170 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc VIN 0 2 0.01
.save all
.end "}
C {gnd.sym} 80 240 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/nfet3_01v8.sym} 60 180 0 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 60 60 0 0 {name=M2
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
C {lab_pin.sym} -120 120 0 0 {name=p1 sig_type=std_logic lab=VIN}
