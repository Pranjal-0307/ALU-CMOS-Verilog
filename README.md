# ⚙️ 8-Bit Pipelined ALU with CMOS Implementation

## 🧠 Overview

This project implements an **8-bit Arithmetic Logic Unit (ALU)** designed using **CMOS gate-level logic** and **Verilog HDL**.  
It features a **4-stage pipelined architecture** with **dual-phase clocking** for safe and efficient operation, providing a practical learning framework for digital design, VLSI, and logic synthesis.

---

## 📂 Folder Structure
8-Bit Pipelined ALU with CMOS implementation
│
├── 📁 Document
│ ├── Waveform.png # Simulation waveform output
│ └── Pipeline_Diagram.png # Schematic/diagram of pipelined architecture
│
├── 📁 Primitives
│ └── gate_library.v # Contains 1-bit CMOS logic modules (adder, subtractor, NAND, NOR, XOR, NOT, etc.)
│
├── 📁 RTL
│ ├── ALU.v # Top-level ALU integrating all 8-bit modules and pipeline stages
│ └── RTL_compents.v # Structural design for 8-bit adders, subtractors, logic units, etc.
│
├── 📁 TB
│ └── ALU_tb.v # Testbench for functional and timing verification
│
├── .gitignore # Git ignore rules
└── README.md # Project documentation

---

## 🔧 Key Features

| 🔢 Feature        | 📝 Description                                                        |
| ----------------- | --------------------------------------------------------------------- |
| 8 Operations      | ADD, SUB, AND, OR, XOR, NOT A, NOT B, INC A                           |
| ⏱️ Pipeline       | 4-stage pipelined architecture for parallel execution                 |
| 🔄 Clocking       | Dual-phase clocks (clk1, clk2) ensure stable timing and no hazards    |
| 🧠 CMOS Logic     | Implemented using NAND, NOR, XOR, and NOT transistor-level primitives |
| 🗃️ Register Bank | 16 × 8-bit registers for operand storage                              |
| 💾 Memory         | 256 × 8-bit memory cells for result storage                           |
| 🚩 Flags          | Carry/Borrow flags for arithmetic operations                         |
| 🧩 Modular        | Hierarchical design for easy debugging and scalability                |

---

## 🏗️ Architecture Overview

The pipelined ALU operates in **four sequential stages**, maximizing throughput and timing stability:

| 🔢 Stage                 | 🛠️ Function                                     |
| ------------------------ | ----------------------------------------------- |
| 1️⃣ Fetch Stage          | Load operands A and B from the register bank     |
| 2️⃣ Execute Stage        | Perform selected ALU operation using CMOS gates  |
| 3️⃣ Register Write Stage | Store result in destination register             |
| 4️⃣ Memory Write Stage   | Write result to memory if enabled                |

##🧩 The schematic representation of this pipeline is shown below:  
📄 `Document/Pipeline_Diagram.png`

---

## 🧰 Tools Used

| 🧠 Tool          | 📝 Purpose                                       |
| ---------------- | ----------------------------------------------- |
| Verilog HDL      | Digital logic and structural design             |
| Icarus Verilog   | Compilation and simulation of HDL modules       |
| GTKWave          | Waveform and timing visualization               |
| CMOS Logic Design| Transistor-level circuit understanding          |

---

## 📤 Output Signals

| 🟢 Signal    | 📝 Description                                            |
| ------------ | --------------------------------------------------------- |
| Zout         | 8-bit output result of ALU operation                      |
| Carry/Borrow | 1-bit status flag for arithmetic operations               |

---

## 🧪 Simulation and Verification

1️⃣ **Compile the Verilog code**

```bash
iverilog -o result RTL/ALU.v TB/ALU_tb.v
```
2️⃣ Run the simulation
```
vvp result
```
3️⃣ View waveforms in GTKWave
```
gtkwave ALU.vcd
```
## 📝 Notes

⚡ The dual-phase clock system ensures that no race or hold-time violations occur between stages.
🧠 The CMOS primitive-based structure gives transistor-level insight into real hardware logic.
🔁 The design is fully modular, allowing easy addition of new operations or wider datapaths.

## 🧩 Future Enhancements
1.Add MUL and DIV operations using iterative or combinational blocks.
2.Integrate forwarding and hazard detection logic for full pipeline control.
3.Extend design for synthesis and layout testing on FPGA or CMOS simulator.

### 🚀 Designed for learning, optimized for performance.
