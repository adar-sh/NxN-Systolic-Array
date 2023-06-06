#                                             4x4 Systolic Array

Systolic array module performs parallel computations using processing elements (PEs). It is a regular grid of PEs that are interconnected to perform efficient computations. Each PE within the systolic array is responsible for executing a number of multiply and accumulate operations. These PEs also facilitate the exchange of inputs with neighboring PEs located in the north and south directions. This inter-PE communication enables efficient data flow and coordination within the systolic array, enhancing the overall parallel processing capabilities of the system.

## Module Breakdown 

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
  - `out_s0` to `out_s15`: Wires to connect the output of one PE to the input of the next PE in the south.
  - `out_e0` to `out_e15`: Wires to connect the output of one PE to the input of the next PE in the east.
  - `result0` to `result15`: Wires to store the output results of each PE.

- Processing Elements (PEs):
  - P0 to P15: These represent the individual PEs in the systolic array. Each PE takes input signals from neighboring PEs and performs a multiply and accumulate using the provided inputs. The output of each PE is connected to the input of the subsequent PE in a cascading manner.

- Control Logic:
  - An `always` block is used to control the `done` signal and the `count` register based on the clock and reset signals. When the reset signal is active (`rst`), the `done` signal is set to 0 and the `count` register is reset to 0. Otherwise, on the positive edge of the clock signal (`posedge clk`), the `count` is incremented by 1 until it reaches 9. Once the count reaches 9, the `done` signal is set to 1 and the `count` is reset to 0.

Overall, this systolic array module performs parallel computations using interconnected PEs and produces a `done` signal to indicate the completion of the computation after a certain number of clock cycles.

## Testbench
The inputs are pipelined. [Testbench](https://github.com/AbJ224/LLM-acceleration-with-2.5D/tree/adarsh/rtl_designs/systolic_Array/Testbench).

![3-s2 0-B9780127345307500088-f08-22-9780127345307](https://github.com/adar-sh/internship/assets/82313948/f7c23314-4e3a-4e84-ac61-db3c6f688282)
## Systolic Array for NxN Matrices
Verilog code for NxN systolic array can be generated using [python script](https://github.com/AbJ224/LLM-acceleration-with-2.5D/blob/adarsh/rtl_designs/systolic_Array/sys_arr.py)
- Matrix size and Bitwidth (precision) can be given as input.
- Here,number of instantions of PEs increases with the input matrix size.

# Processing Element 

Processing element (PE) module performs computations on two input values `inp_n` and `inp_w`. The PE module uses a floating-point multiplier (`floating_multi`) and a floating-point adder (`float_adder`) to perform the multiply accumulate operation. The module also includes a flip-flop (`d_ff`) to give necessary (1 clock) delay.

## Module Breakdown

- Parameters:
  - `xlen`: Parameter specifying the width of the data (default value is 16).

- Inputs:
  - `inp_n`: Input signal from north of PE.
  - `inp_w`: Input signal from west of PE.
  - `clk`: Clock input.
  - `rst`: Reset input.

- Outputs:
  - `out_s`: Output register of width `xlen` representing the output towards south.
  - `out_e`: Output register of width `xlen` representing the output towards east.
  - `out`: Output signal of width `xlen` representing the result.

- Internal wires:
  - `prod`: Wire of width `xlen` to transmit the result of the floating-point multiplication (`floating_multi`) to adder (`float_adder`).
  - `res_i`: Wire of width `xlen` to transmit the output from adder (`float_adder`) to DFF (`d_ff`).
  - `result`: Wire of width `xlen` to store the final result and it connects to the second input of (`float_adder`)..

- Floating-Point Multiplier:
  - The module includes an instance of a floating-point multiplier (`floating_multi`) named `F1`. It takes the inputs `inp_n` and `inp_w` and produces the product `prod` as output.

- Floating-Point Adder:
  - The module includes an instance of a floating-point adder (`float_adder`) named `ad1`. It takes the inputs `prod` and `result` and produces the sum `res_i` as output.

- Flip-Flop:
  - The module includes an instance of a flip-flop (`d_ff`) named `d1` for providing a single clock cycle delay for synchronization of accumulator. It takes the clock input `clk`, reset input `rst`, and the input `res_i`. The output of the flip-flop is stored in `result`. 

- Control Logic:
  - The `always` block is triggered on the positive edge of the clock signal (`posedge clk`). When the reset signal `rst` is active, the outputs `out_e` and `out_s` are set to 0. Otherwise, the outputs are updated with the values of `inp_w` and `inp_n`, respectively.

- Output Assignment:
  - The `out` signal is assigned the value of `result` using the `assign` statement.

The PE module performs the multiplication and addition operations on the input values `inp_n` and `inp_w` using the specified floating-point multiplier and adder. The intermediate results are stored in flip-flops, and the final result is available on the `out` output signal.

![Screenshot 2023-05-26 122352](https://github.com/adar-sh/internship/assets/82313948/2c0e8355-db40-475b-b0da-0a777473569f)

![image](https://github.com/adar-sh/internship/assets/82313948/f35bdcf9-d3fb-4810-96ae-684a0cc8792d)
