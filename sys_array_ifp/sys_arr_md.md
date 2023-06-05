Systolic array module performs parallel computations using processing elements (PEs). A systolic array is a regular grid of PEs that are interconnected to perform efficient computations. Each PE performs a specific operation and passes the intermediate results to its neighboring PEs.

Here's a breakdown of the module:

- Inputs: 
  - `inp_w0`, `inp_w4`, `inp_w8`, `inp_w12`: 16-bit input data for PEs P0, P4, P8, and P12, respectively.
  - `inp_n0`, `inp_n1`, `inp_n2`, `inp_n3`: 16-bit input data for PEs P0, P1, P2, and P3, respectively.
  - `clk`: Clock input.
  - `rst`: Reset input.

- Outputs: 
  - `done`: Output signal indicating the completion of the computation.

- Internal wires:
  - `count`: 4-bit register used to count the number of clock cycles.
  - `inp_n0`, `inp_n1`, `inp_n2`, `inp_n3`: Wires to connect the inputs to the respective PEs.
  - `inp_w0`, `inp_w4`, `inp_w8`, `inp_w12`: Wires to connect the inputs to the respective PEs.
  - `out_s0` to `out_s15`: Wires to connect the output of one PE to the input of the next PE.
  - `out_e0` to `out_e15`: Wires to connect the output of one PE to the input of the next PE.
  - `result0` to `result15`: Wires to store the output results of each PE.

- Processing Elements (PEs):
  - P0 to P15: These represent the individual PEs in the systolic array. Each PE takes input signals from neighboring PEs and performs a computation using the provided inputs and clock signal. The output of each PE is connected to the input of the subsequent PE in a cascading manner.

- Control Logic:
  - An `always` block is used to control the `done` signal and the `count` register based on the clock and reset signals. When the reset signal is active (`rst`), the `done` signal is set to 0 and the `count` register is reset to 0. Otherwise, on the positive edge of the clock signal (`posedge clk`), the `count` is incremented by 1 until it reaches 9. Once the count reaches 9, the `done` signal is set to 1 and the `count` is reset to 0.

Overall, this systolic array module performs parallel computations using interconnected PEs and produces a `done` signal to indicate the completion of the computation after a certain number of clock cycles.

![3-s2 0-B9780127345307500088-f08-22-9780127345307](https://github.com/adar-sh/internship/assets/82313948/f7c23314-4e3a-4e84-ac61-db3c6f688282)
