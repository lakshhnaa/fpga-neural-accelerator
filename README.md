# 🚀 FPGA Neural Accelerator

An 8×8 systolic-array-based neural network accelerator implemented in Verilog HDL with ReLU activation and waveform verification.

---

## Features

* 8×8 Systolic Array
* Processing Elements (PE)
* Controller FSM
* Input Buffer
* Weight Buffer
* ReLU Activation
* Output Buffer
* GTKWave Verification
* Icarus Verilog Simulation

---

## Architecture

![System Architecture](diagrams/system_architecture.png)

---

## RTL Modules

* controller_fsm.v
* input_buffer.v
* weight_buffer.v
* pe.v
* systolic_array.v
* relu.v
* output_buffer.v
* neural_accelerator_top.v

---

## FSM Waveform

![FSM Waveform](results/screenshots/fsm_waveform.png)

---

## Processing Element Waveform

![PE Waveform](results/screenshots/pe_waveform.png)

---

## Simulation Result

![Matrix Output](results/screenshots/matrix_output.png)

---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

---

## Future Improvements

* Parameterized N×N architecture
* Fixed-point arithmetic
* BRAM-based storage
* AXI interface
* Vivado synthesis
* FPGA deployment
* CNN acceleration
* TinyML inference

---

## Author

**Lakshnaa B J**

Electronics and Computer Science Engineering
VIT Chennai

Interests: FPGA • VLSI • Embedded Systems • AI Hardware
