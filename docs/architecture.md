# FPGA Neural Network Accelerator

## Problem Statement

Neural networks require a large number of matrix multiplications.

Traditional CPUs execute these operations sequentially, resulting in higher latency.

An FPGA-based neural accelerator can exploit parallel hardware to accelerate inference.

## Existing Hardware

- 8×8 Systolic Array
- 64 Processing Elements
- Verilog RTL
- Verilator Simulation

## Target Architecture

Input Buffer
↓
Weight Buffer
↓
8×8 Systolic Array
↓
Accumulator
↓
ReLU
↓
Output Buffer

## Future Modules

- Input Buffer
- Weight Buffer
- Controller FSM
- ReLU
- Output Buffer
- Quantization