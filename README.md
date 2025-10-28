# Dual Port RAM in Verilog 🧠✨

This repository contains a synthesizable **Dual-Port RAM** design in Verilog with a complete testbench for simulation. It features **independent ports** for simultaneous Read and Write operations, powered by a synchronous clocked system.

---

## 🔍 Features

- Two independent access ports (Port A and Port B)
- Parameterized Data Width and Address Width
- Supports Read and Write operations on both ports
- Synchronous behavior with `clk`
- Console output + waveform view for validation

---

## 📌 Signal Description

| Signal | Port | Direction | Description |
|--------|------|-----------|-------------|
| clk | A+B | Input | Clock input |
| rst | A+B | Input | Asynchronous active-high reset |
| data_a | A | Input | Write data for Port A |
| data_b | B | Input | Write data for Port B |
| addr_a | A | Input | Address for Port A |
| addr_b | B | Input | Address for Port B |
| a | A | Input | Port A mode: `1`=Write, `0`=Read |
| b | B | Input | Port B mode: `1`=Write, `0`=Read |
| out_a | A | Output | Read data from Port A |
| out_b | B | Output | Read data from Port B |

Memory Declaration:



---

## 🧪 Testbench Flow

1. Reset system
2. Write values (address = data) at **Port A**
3. Read back from Port A
4. Write values at **Port B**
5. Read back from Port B
6. Print full RAM content to console
7. Generate waveform (`dump.vcd`)

Console output example:


---

## 🚦Simulation Commands

### Icarus Verilog
```sh
iverilog -o ram_tb tb.v
vvp ram_tb
