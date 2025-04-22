# Verilog 16-Bit CPU

A custom 16-bit single-cycle RISC-style processor implemented in Verilog, tested on the Basys3 FPGA using Xilinx Vivado. The processor supports 10 core instructions including arithmetic, logic, memory access, and control flow operations.

---

## 🚀 Features

- Custom **16-bit RISC Instruction Set**
- **Single-cycle architecture** with modular Verilog components
- **Register file**, **ALU**, **data & instruction memory**, **control unit**, and **program counter**
- Instruction and ALU output display via:
  - **16 LEDs** (write-back or memory/store values)
  - **4-digit 7-segment display** (current instruction)
- **2-button instruction execution**:
  - **First press**: Displays value of `rt/rd` before execution
  - **Second press**: Executes the instruction and updates the output
- Fully integrated with **Basys3 FPGA** via XDC constraints
- Simulated using a custom Verilog **testbench**

---

## 🧠 Supported Instructions

| Type     | Instructions                   |
|----------|--------------------------------|
| R-type   | `add`, `sub`, `sll`, `and`     |
| I-type   | `addi`, `lw`, `sw`, `beq`, `bne` |
| J-type   | `jmp`                          |

All instructions are encoded in a 16-bit custom ISA format with word-aligned addressing.

---

## 🧪 Sample Program Tested

```assembly
0x3105   ; ADDI R1, R0, 5
0x33F3   ; ADDI R3, R15, 3
0x3542   ; ADDI R5, R4, 2
0x3761   ; ADDI R7, R6, 1
0x0130   ; ADD  R1, R3, R0   ; R1 = R3 + R0 = 8
0x0331   ; SUB  R3, R3, R3   ; R3 = 0
0x0773   ; AND  R7, R7, R7   ; R7 = 1
0x0552   ; SLL  R5, R5, R5   ; R5 = 2 << 2 = 8
0x2102   ; SW   R1, R0, 2    ; Mem[2] = 8
0x1B02   ; LW   R11, R0, 2   ; R11 = 8
0x4991   ; BEQ  R9, R9, 1    ; Skip next
0x3101   ; ADDI R1, R0, 1    ; (Skipped)
0x3AA4   ; ADDI R10, R10, 4
0x51A1   ; BNE  R1, R10, 1   ; Skip next
0x0000   ; ADD  R0, R0, R0   ; (Skipped)
0x6FFC   ; JMP -4            ; Loop
```

## 📁 File Structure

```
├── cpu.v                  # Top-level CPU module with button-controlled execution
├── alu.v                  # Arithmetic and logic operations
├── alu_control.v          # ALU control logic to decode funct field
├── register_file.v        # 16-register file with 2 read and 1 write port
├── data_memory.v          # 64-word data memory (16-bit wide)
├── instruction_memory.v   # Program ROM with sample test instructions
├── control_unit.v         # Main control decoder based on opcode
├── program_counter.v      # PC with enable and reset support
├── shift_left_1.v         # Logical left shift by 1 for branches/jumps
├── mux2_1_4.v             # 2-to-1 multiplexer for 4-bit signals
├── mux2_1_16.v            # 2-to-1 multiplexer for 16-bit signals
├── seven_seg_display.v    # Converts 16-bit instruction into 7-segment display format
├── cpu_tb.v               # Full testbench simulating 40 button presses
├── constraints.xdc        # Pin configuration for Basys3 board (buttons, LEDs, 7-seg)
```

## 🛠 Tools & Tech Stack

- **Languages**: Verilog (HDL)
- **Simulation**: Xilinx Vivado Simulator
- **Hardware**: Basys3 FPGA (Artix-7)
- **Features Used**:
  - Behavioral modeling
  - Combinational and sequential logic
  - Modular hierarchical design
  - RTL simulation and waveform analysis
  - Real hardware testing with I/O peripherals

---

## 🚧 Future Enhancements

- Add support for more instructions (e.g., `or`, `xor`, `nop`, `halt`)

---

## 📸 Demo

> - Waveform of Rt/Rd values before and after
> - <img width="1143" alt="Screenshot 2025-04-10 at 2 40 12 PM" src="https://github.com/user-attachments/assets/a7628192-1817-4ffc-b52e-bd5014d62a2a" />

> - 16 bit Architecture
> - <img width="1420" alt="Screenshot 2025-04-10 at 2 26 28 PM" src="https://github.com/user-attachments/assets/1e1dbe59-a202-4a6e-a0ca-eb3917e48ccd" />


---

## 👨‍💻 Author

**Arpit Dilip Sharma**  
📍 Master's Student @ University at Buffalo  
🔗 [LinkedIn](https://www.linkedin.com/in/arpitsharma2010/) • [GitHub](https://github.com/arpitsharma2010)
