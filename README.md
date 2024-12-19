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



## **Voltage and Current Sources: Functional Configurations**

### **1. DC Source (Constant Value)**
- **Purpose**: Provides a fixed voltage or current.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 DC 1.8
  I1 node1 node2 DC 1m
  ```
- **Description**: Supplies a constant value (e.g., 1.8V).

---

### **2. AC Source (Sinusoidal Signal)**
- **Purpose**: Provides a sinusoidal waveform for AC analysis.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 AC 1
  ```
- **Description**: Used for frequency-domain analysis.

---

### **3. Pulse Source**
- **Purpose**: Generates a square or rectangular pulse waveform.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 PULSE(V1 V2 Tdelay Trise Tfall Ton Tperiod)
  ```
  **Example**:
  ```spice
  V1 1 0 PULSE(0 1.8 1ns 10ps 10ps 50ns 100ns)
  ```
- **Parameters**:
  - `V1`: Initial voltage.
  - `V2`: Peak voltage.
  - `Tdelay`: Time delay before the pulse starts.
  - `Trise`: Rise time.
  - `Tfall`: Fall time.
  - `Ton`: Time the pulse stays high.
  - `Tperiod`: Total period of the pulse.

---

### **4. Sinusoidal Source**
- **Purpose**: Generates a sine wave.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 SIN(Voff Vamp Freq Tdelay Damping)
  ```
  **Example**:
  ```spice
  V1 1 0 SIN(0 1.8 1Meg 0 0)
  ```
- **Parameters**:
  - `Voff`: Offset voltage.
  - `Vamp`: Amplitude.
  - `Freq`: Frequency (Hz).
  - `Tdelay`: Start delay.
  - `Damping`: Exponential damping factor.

---

### **5. Piecewise Linear Source**
- **Purpose**: Provides a user-defined waveform using linear segments.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 PWL(T1 V1 T2 V2 ... Tn Vn)
  ```
  **Example**:
  ```spice
  V1 1 0 PWL(0ns 0V 10ns 1V 20ns 0V)
  ```
- **Description**: Voltage or current changes at specified times to specified values.

---

### **6. Exponential Source**
- **Purpose**: Generates an exponential waveform.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 EXP(V1 V2 T1 T2 Tau1 Tau2)
  ```
- **Parameters**:
  - `V1`: Initial voltage.
  - `V2`: Final voltage.
  - `T1`: Time delay before the rise starts.
  - `T2`: Time delay before the fall starts.
  - `Tau1`: Rise time constant.
  - `Tau2`: Fall time constant.

---

### **7. Arbitrary Waveform Source (Using a File)**
- **Purpose**: Supplies a waveform defined by an external file.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 FILE("waveform.dat")
  ```
  **Example Content of `waveform.dat`**:
  ```
  0    0
  1n   1.8
  2n   0
  ```

---

### **8. Behavioral Source**
- **Purpose**: Allows complex mathematical expressions for voltage or current.
- **SPICE Syntax**:
  ```spice
  B1 node1 node2 V=expression
  ```
  **Example**:
  ```spice
  B1 1 0 V=(2*sin(2*pi*1Meg*time) + 1)
  ```
- **Description**: Useful for creating custom waveforms or behaviors.

---

### **9. Noise Source**
- **Purpose**: Adds noise for simulation purposes.
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 NOISE(Vrms Fmin Fmax)
  ```
  **Example**:
  ```spice
  V1 1 0 NOISE(1mV 10k 1Meg)
  ```
- **Description**: Simulates voltage or current noise in circuits.

---

### **10. Parameter-Dependent Source**
- **Purpose**: Voltage/current depends on a parameter (e.g., temperature or time).
- **SPICE Syntax**:
  ```spice
  V1 node1 node2 DC param_value
  ```
  **Example**:
  ```spice
  .param VDD=1.8
  V1 node1 node2 DC {VDD}
  ```

---

### **Switching Between Functionalities in Xschem**

1. **Add Power Sources**:
   - Go to the **Xschem Library → Devices** and place a **voltage** or **current source** on the schematic.

2. **Edit Attributes**:
   - Right-click the source symbol.
   - Add or modify attributes (e.g., `PULSE`, `SIN`, `PWL`).

3. **Define Parameters**:
   - Use `.param` statements for flexibility.
   - Example:
     ```spice
     .param VDD=1.8
     V1 node1 node2 DC {VDD}
     ```

4. **Combine Functionalities**:
   - Use behavioral sources (`B`) for advanced dependencies or combined waveforms.

---

### **Tips**
- Use **PULSE** for digital circuits (e.g., clock signals).
- Use **SIN** for analog filters and AC analysis.
- Use **PWL** for custom test signals.
- Use **.param** to allow easy modification of source values.

This list includes all major configurations for power sources in Xschem and SPICE simulations. Let me know if you'd like examples for specific use cases!
```

```markdown
### Comprehensive Xschem Shortcuts, Commands, and Power Source Configurations

---

## **Xschem Shortcuts**

| **Action**                              | **Shortcut**                  |
|-----------------------------------------|--------------------------------|
| Open File                               | `Ctrl + O`                    |
| Save File                               | `Ctrl + S`                    |
| Save As                                 | `Shift + Ctrl + S`            |
| Zoom In                                 | `+` (or `Ctrl + Scroll Up`)   |
| Zoom Out                                | `-` (or `Ctrl + Scroll Down`) |
| Pan View                                | `Arrow Keys` or `Middle Mouse Drag` |
| Center View                             | `Ctrl + C`                    |
| Align Components on Grid                | `Ctrl + G`                    |
| Wire Mode                               | `W`                           |
| Text Mode                               | `T`                           |
| Place Component                         | `I`                           |
| Move Component                          | `M`                           |
| Copy Component                          | `C`                           |
| Rotate Component                        | `R`                           |
| Flip Component Horizontally             | `H`                           |
| Flip Component Vertically               | `V`                           |
| Delete Selected Item                    | `Del`                         |
| Undo Action                             | `Ctrl + Z`                    |
| Redo Action                             | `Ctrl + Y`                    |
| Open Simulation Menu                    | `Ctrl + M`                    |
| Generate Netlist                        | `Ctrl + N`                    |
| Run Simulation                          | `Ctrl + R`                    |
| Exit Xschem                             | `Ctrl + Q`                    |

---

## **Xschem Commands**

### File Operations

| **Command**                             | **Description**               |
|-----------------------------------------|--------------------------------|
| `open <filename.sch>`                   | Open a specific schematic file|
| `save`                                  | Save the current schematic    |
| `saveas <new_filename.sch>`             | Save schematic with a new name|

### Grid and Layout

| **Command**                             | **Description**               |
|-----------------------------------------|--------------------------------|
| `grid on`                               | Turn grid display on          |
| `grid off`                              | Turn grid display off         |
| `snap_grid`                             | Enable snapping to grid       |

### Simulation

| **Command**                             | **Description**               |
|-----------------------------------------|--------------------------------|
| `simulate`                              | Open the simulation menu      |
| `netlist`                               | Generate the circuit netlist  |
| `show_netlist`                          | Display the generated netlist |
| `run_simulation`                        | Start simulation using NGSPICE|

### View

| **Command**                             | **Description**               |
|-----------------------------------------|--------------------------------|
| `zoom_in`                               | Zoom in on the schematic      |
| `zoom_out`                              | Zoom out of the schematic     |
| `center_view`                           | Center the schematic view     |

### Edit

| **Command**                             | **Description**               |
|-----------------------------------------|--------------------------------|
| `add_wire`                              | Enter wiring mode             |
| `add_component`                         | Add a component to the schematic|
| `move`                                  | Move a selected component     |
| `rotate`                                | Rotate a selected component   |
| `delete`                                | Delete a selected component   |
| `text`                                  | Add a text annotation         |

---

## **Voltage and Current Sources Configurations**

### DC Source
```spice
V1 node1 node2 DC 1.8
I1 node1 node2 DC 1m
```

### AC Source
```spice
V1 node1 node2 AC 1
```

### Pulse Source
```spice
V1 node1 node2 PULSE(V1 V2 Tdelay Trise Tfall Ton Tperiod)
```
Example:
```spice
V1 1 0 PULSE(0 1.8 1ns 10ps 10ps 50ns 100ns)
```

### Sinusoidal Source
```spice
V1 node1 node2 SIN(Voff Vamp Freq Tdelay Damping)
```
Example:
```spice
V1 1 0 SIN(0 1.8 1Meg 0 0)
```

### Piecewise Linear Source
```spice
V1 node1 node2 PWL(T1 V1 T2 V2 ... Tn Vn)
```
Example:
```spice
V1 1 0 PWL(0ns 0V 10ns 1V 20ns 0V)
```

### Exponential Source
```spice
V1 node1 node2 EXP(V1 V2 T1 T2 Tau1 Tau2)
```

### Arbitrary Waveform Source
```spice
V1 node1 node2 FILE("waveform.dat")
```

### Behavioral Source
```spice
B1 node1 node2 V=expression
```
Example:
```spice
B1 1 0 V=(2*sin(2*pi*1Meg*time) + 1)
```

### Noise Source
```spice
V1 node1 node2 NOISE(Vrms Fmin Fmax)
```
Example:
```spice
V1 1 0 NOISE(1mV 10k 1Meg)
```

### Parameter-Dependent Source
```spice
V1 node1 node2 DC param_value
```
Example:
```spice
.param VDD=1.8
V1 node1 node2 DC {VDD}
```

---



### **Notes**
- Commands like `.save`, `.tran`, and `.dc` can be combined for more complex simulations.
- Always refer to NGSPICE documentation for detailed syntax and advanced features.
