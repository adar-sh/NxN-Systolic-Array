# Processing Element 

Processing element (PE) module performs computations on two input values `inp_n` and `inp_w`. The PE module uses a floating-point multiplier (`floating_multi`) and a floating-point adder (`float_adder`) to perform the computations. The module also includes a flip-flop (`d_ff`) to give necessary (1 clock) delay.

Here's a breakdown of the module:

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
  - `out`: Output signal of width `xlen` representing the final result.

- Internal wires:
  - `prod`: Wire of width `xlen` to transmit the result of the floating-point multiplication to adder.
  - `res_i`: Wire of width `xlen` to store the intermediate result from the adder.
  - `result`: Wire of width `xlen` to store the final result.

- Floating-Point Multiplier:
  - The module includes an instance of a floating-point multiplier (`floating_multi`) named `F1`. It takes the inputs `inp_n` and `inp_w` and produces the product `prod` as output.

- Floating-Point Adder:
  - The module includes an instance of a floating-point adder (`float_adder`) named `ad1`. It takes the inputs `prod` and `result` and produces the sum `res_i` as output.

- Flip-Flop:
  - The module includes an instance of a flip-flop (`d_ff`) named `d1`. It takes the clock input `clk`, reset input `rst`, and the input `res_i`. The output of the flip-flop is stored in `result`.

- Control Logic:
  - The `always` block is triggered on the positive edge of the clock signal (`posedge clk`). When the reset signal `rst` is active, the outputs `out_e` and `out_s` are set to 0. Otherwise, the outputs are updated with the values of `inp_w` and `inp_n`, respectively.

- Output Assignment:
  - The `out` signal is assigned the value of `result` using the `assign` statement.

The PE module performs the multiplication and addition operations on the input values `inp_n` and `inp_w` using the specified floating-point multiplier and adder. The intermediate results are stored in flip-flops, and the final result is available on the `out` output signal.

![Screenshot 2023-05-26 122352](https://github.com/adar-sh/internship/assets/82313948/2c0e8355-db40-475b-b0da-0a777473569f)

