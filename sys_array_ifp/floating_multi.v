module floating_multi(
	input [15:0]A,B,
	output reg [15:0]out
);
reg [10:0]mantA,mantB;
reg [9:0]Mant;
reg [21:0]tempMant;
reg [4:0]expA,expB,tempExp,exp;
reg signA,signB,Sign;

always@ *
begin
if (A==0 || B==0) out=0;
else begin 
mantA={1'b1,A[9:0]};
mantB={1'b1,B[9:0]};


expA=A[14:10];
expB=B[14:10];
tempExp=expA+expB-15;

signA=A[15];
signB=B[15];

tempMant=mantA*mantB;
Mant=tempMant[21]?tempMant[21:11]:tempMant[19:10];
exp=tempMant[21]?tempExp+1:tempExp;

Sign=signA^signB;

out={Sign,exp,Mant};
end
end
endmodule
