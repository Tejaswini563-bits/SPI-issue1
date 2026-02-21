This project presents a Register Transfer Level (RTL) implementation of the Serial Peripheral Interface (SPI) protocol using Verilog HDL. The design includes both SPI Master and SPI Slave modules enabling reliable full-duplex communication.

The implementation follows standard SPI timing requirements and is verified through behavioral simulation and waveform analysis.

* Objectives

Design an SPI Master module

Design an SPI Slave module

Implement full-duplex serial communication

Validate timing and functionality through simulation

Ensure modular, scalable RTL design

*System Architecture
🔹 SPI Master

Generates SPI Clock (SCLK)

Controls Slave Select (SS)

Transmits data via MOSI

Receives data via MISO

FSM-based transmission control

🔹 SPI Slave

Receives SCLK from Master

Reads incoming MOSI data

Sends data back through MISO

Synchronous shift register operation

⚙️ Working Principle

Master asserts Slave Select (SS).

Master generates serial clock (SCLK).

Data is shifted out bit-by-bit through MOSI.

Slave simultaneously shifts response through MISO.

After transmission, SS is de-asserted.

The design supports accurate synchronous full-duplex communication.

🧠 Design Methodology

RTL design using Verilog HDL

Finite State Machine (FSM) control logic

Modular architecture for reusability

Behavioral simulation for functional verification

Waveform-based timing validation

🧪 Simulation & Verification
✔ Verified Functionalities

Correct SPI clock generation

Proper bit-shifting sequence

Accurate full-duplex data exchange

Correct Slave Select timing

Compliance with SPI protocol timing

Simulation waveforms confirm successful Master-Slave communication.

📂 Project Structure
SPI_Project/
│
├── spi_master.v
├── spi_slave.v
├── spi_top.v
├── spi_testbench.v
└── README.md
🛠 Tools Used

Verilog HDL

ModelSim / Vivado Simulator (or equivalent)

Waveform Viewer for timing analysis

🚀 Applications

Embedded systems communication

Sensor interfacing

Memory device communication

ADC/DAC interfacing

Microcontroller-based systems

📌 Conclusion

The SPI Master-Slave communication system was successfully implemented and verified at RTL level. The design demonstrates reliable full-duplex serial communication with proper timing control and FSM-based architecture. The modular approach ensures scalability for advanced enhancements such as multi-slave support or configurable clock polarity/phase.

📜 License

This project is developed for academic and learning purposes only.
