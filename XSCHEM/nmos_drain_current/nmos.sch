v {xschem version=3.4.6 file_version=1.2
* Copyright 2021 Stefan Frederik Schippers
* 
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     https://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.

}
G {}
K {}
V {}
S {}
E {}
N 2340 -600 2340 -580 {lab=#net1}
N 2340 -600 2420 -600 {lab=#net1}
N 2460 -660 2460 -630 {lab=#net2}
N 2460 -740 2460 -720 {lab=#net3}
N 2580 -740 2580 -640 {lab=#net3}
N 2460 -740 2580 -740 {lab=#net3}
C {sky130_fd_pr/nfet3_01v8.sym} 2440 -600 0 0 {name=M1
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
C {res.sym} 2460 -690 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 2340 -550 0 0 {name=V1 value=3 savecurrent=false}
C {vsource.sym} 2580 -610 0 0 {name=V2 value=3 savecurrent=false}
C {gnd.sym} 2460 -570 0 0 {name=l1 lab=GND}
C {gnd.sym} 2580 -580 0 0 {name=l2 lab=GND}
C {gnd.sym} 2340 -520 0 0 {name=l3 lab=GND}
C {code_shown.sym} 2150 -420 2 1 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc V2 0 1.8 .1m V1 0 2 .5
.save all
.end"}
