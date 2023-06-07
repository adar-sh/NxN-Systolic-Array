import math
sys_Arr = open('array.txt', 'w')
bit = int(input("Bit Size"))-1
size = int(input("Matrix Size"))
count_bit = math.ceil(math.log2(2*(size+1)))

sys_Arr.write("module syst_arr"+str(size)+"(\n\tinput ["+str(bit)+":0] ")
for i in range(size):
    sys_Arr.write("inp_w"+str(i*size)+",")
for i in range(size):
    sys_Arr.write("inp_n"+str(i)+",")
sys_Arr.write(
    "\n\toutput reg done,\n\tinput clk,rst,\n\treg ["+str(count_bit-1)+":0] count\n\t);\n")

for i in range(size):
    sys_Arr.write("wire ["+str(bit)+":0] inp_w"+str(i*size)+";\n")

for i in range(size):
    sys_Arr.write("\nwire ["+str(bit)+":0] inp_n"+str(i)+";\n")
    sys_Arr.write("wire  ["+str(bit)+":0] out_s"+str(i)+";\n")
    sys_Arr.write("wire  ["+str(bit)+":0] out_e"+str(i)+";\n")
    sys_Arr.write("wire  ["+str(bit)+":0] result"+str(i)+";\n")


sys_Arr.write("\nPE P0 (inp_n0, inp_w0, clk, rst, out_s0, out_e0, result0);\n")

sys_Arr.write("\n")

for i in range(1, size):
    sys_Arr.write("PE P"+str(i)+"(inp_n"+str(i)+", out_e"+str(i) +
                  ", clk, rst, out_s"+str(i)+", out_e"+str(i)+", result"+str(i)+");\n")

for i in range(1, size):
    sys_Arr.write("\nPE P"+str(i*size)+"(out_s"+str((i-1)*(size))+", inp_w"+str(i*size) +
                  ", clk, rst, out_s"+str(i*size)+", out_e"+str(i*size)+", result"+str(i*size)+");")


for i in range(1, size):
    sys_Arr.write("\n")
    for j in range(1, size):
        sys_Arr.write("\nPE P"+str(i*size+j)+"(out_s"+str((i*size+j)-size)+", out_e"+str((i*size+j)-1) +
                      ", clk, rst, out_s"+str(i*size+j)+", out_e"+str(i*size+j)+", result"+str(i*size+j)+");")


always_block = code = '''
always @(posedge clk or posedge rst) begin
    if(rst) begin
        done <= 0;
        count <= 0;
    end
    else begin
        if(count == 9) begin
            done <= 1;
            count <= 0;
        end
        else begin
            done <= 0;
            count <= count + 1;
        end
    end
endmodule
'''

sys_Arr.write("\n\n"+always_block)

sys_Arr.close()

# 0   1   2   3
# 4   5   6   7
# 8   9   10  11
# 12  13  14  15
# if(count == 9) begin
# 	done <= 1;
# 	count <= 0;
# end
# else begin
# done <= 0;
# count <= count + 1;
# end
# end
# end
# endmodule"
