# CMOS_VLSI_DESIGNS


# NGSPICE Command Reference

- This document provides a comprehensive list of NGSPICE commands to assist with circuit simulation and analysis.

---

## **General Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Load a SPICE netlist                    | `source <filename.cir>`                        |
| Save all simulation outputs             | `.save all`                                    |
| Save specific signals                   | `.save V(out) I(R1)`                           |
| Print simulation outputs (e.g., voltage)| `print V(out)`                                 |
| Plot voltage or current                 | `plot V(out)` or `plot I(R1)`                 |
| Quit NGSPICE                            | `quit`                                         |
| Run simulation                          | `run`                                          |
| Restart simulation                      | `reset`                                        |
| View operating point values             | `show`                                         |
| Show circuit description                | `listing`                                      |
| Export simulation data                  | `write <filename.raw>`                         |
| Load exported data                      | `load <filename.raw>`                          |
| Control verbosity of output             | `set <option>`                                 |

---

## **DC Analysis Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Perform a DC Sweep                      | `.dc <source> <start> <stop> <step>`          |
| Example (DC Sweep)                      | `.dc V1 0 5 0.1`                              |
| Perform Nested DC Sweep                 | `.dc <source1> <start1> <stop1> <step1> <source2> <start2> <stop2> <step2>` |
| Example (Nested Sweep)                  | `.dc V1 0 5 0.1 V2 0 3 0.5`                   |

---

## **Transient Analysis Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Perform Transient Analysis              | `.tran <tstep> <tstop>`                       |
| Example (Transient)                     | `.tran 1n 1u`                                 |
| Skip initial transient points           | `.tran <tstep> <tstop> UIC`                   |
| Save transient results                  | `.save <node_names>`                          |

---

## **AC Analysis Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Perform AC Sweep                        | `.ac <type> <points_per_decade> <start_freq> <stop_freq>` |
| Example (AC Sweep)                      | `.ac dec 10 1k 10Meg`                         |
| Specify decibel scaling for results     | `set scale=log` or `set scale=lin`            |

---

## **Noise Analysis Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Perform Noise Analysis                  | `.noise <output_variable> <input_source> <type> <start_freq> <stop_freq>` |
| Example (Noise Analysis)                | `.noise V(out) Vin dec 10 1k 10Meg`           |

---

## **Parametric Sweep Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Perform a Parametric Sweep              | `.step param <param_name> <start> <stop> <step>` |
| Example (Step Sweep)                    | `.step param R1 list 1k 10k 100k`             |
| Nested Parameter Sweep                  | `.step param <param1> <start> <stop> <step> <param2> <start> <stop> <step>` |

---

## **Operating Point Analysis Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Compute Operating Point                 | `.op`                                         |
| Example                                 | `.op`                                         |
| Display Operating Point Values          | `show all`                                    |

---

## **Measurement Commands (.meas)**

| **Purpose**                             | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Measure Rise Time                       | `.meas tran rise_time TRIG v(out) VAL=0.5 RISE=1 TARG v(out) VAL=1.8 RISE=1` |
| Measure Fall Time                       | `.meas tran fall_time TRIG v(out) VAL=1.8 FALL=1 TARG v(out) VAL=0.5 FALL=1` |
| Measure Propagation Delay               | `.meas tran tpd TRIG v(in) VAL=0.9 FALL=1 TARG v(out) VAL=0.5 FALL=1` |
| Measure Contamination Delay             | `.meas tran tcd TRIG v(in) VAL=0.1 FALL=1 TARG v(out) VAL=0.9 FALL=1` |
| Measure Average Power                   | `.meas tran avg_power AVG power INTR(start_time, end_time)` |
| Measure RMS Voltage                     | `.meas tran rms_value RMS v(out)`             |
| Measure Maximum Voltage                 | `.meas tran max_voltage MAX v(out)`           |
| Measure Minimum Voltage                 | `.meas tran min_voltage MIN v(out)`           |
| Measure Period                          | `.meas tran period TRIG v(out) VAL=0.9 RISE=1 TARG v(out) VAL=0.9 RISE=2` |
| Measure Frequency                       | `.meas tran freq PARAM=1/period`              |

---

## **Utility Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Perform Fourier Analysis                | `.four <frequency> V(out)`                    |
| Adjust Temperature                      | `.temp <temperature>`                         |
| Set Initial Conditions                  | `.ic V(node)=<value>`                         |
| Modify SPICE Options                    | `.options <option_name>=<value>`              |
| Example (Modify Tolerance)              | `.options reltol=1e-4`                        |

---

## **Advanced Commands**

| **Task**                                | **Command**                                    |
|-----------------------------------------|------------------------------------------------|
| Monte Carlo Analysis                    | `.mc <num_runs> param=<value_range>`          |
| Temperature Sweep                       | `.temp <start_temp> <stop_temp>`              |
| DC Sensitivity Analysis                 | `.sens <node> <element>`                      |
| Example (Sensitivity)                   | `.sens V(out) R1`                             |

---

### **Notes**
- Commands like `.save`, `.tran`, and `.dc` can be combined for more complex simulations.
- Always refer to NGSPICE documentation for detailed syntax and advanced features.
