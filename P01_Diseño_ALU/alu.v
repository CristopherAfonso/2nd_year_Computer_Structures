// Práctica 1 E.C - Objetivo 4, crear el módulo ALU usando los bloques que ya
// he creado y probarlo con su Test Bench (dado por el profesor)
// Cristopher Manuel Afonso Mora - alu0101402031

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire arit);
  //Declaración de conexiones o variables internas:
  reg [3:0] kZero = 4'b0000;
  wire [3:0] out_B, OP1, OP2;
  wire op1_A, op2_B, cpl, Cin0;
  wire Cout0, Cout1, Cout2, Cout3;
  wire out_or1, not_arit, not_ALUOp0, not_ALUOp1;
  wire not_R0, not_R1, not_R2, not_R3;

  //Estructura interna: Instancias de puertas y sus conexiones

  // Si arit = 1, definimos los valores de Cin0, si arit = 0, Cin0 = 0
  or or1(out_or1, ALUOp[0], ALUOp[1]);
  and and1(Cin0, arit, out_or1);

  // Si arit = 1, definimos los valores para OP2 modificando cpl, si arit = 0, OP2 = out_B
  and and2(cpl, arit, ALUOp[0]);

  // Si arit = 1, definimos los valores de OP1, modificando op1_A
  not not1(not_arit, arit);
  not not2(not_ALUOp1, ALUOp[1]);
  or or2(op1_A, not_arit, not_ALUOp1);
  // śi arit = 0, siempre debe salir A,
  // si arit = 1, decide el otro not cual valor saldrá

  // Si arit = 1, definimos los valores de OP2, modificando op2_B, solo cuando
  // arit = 1, ALUOp[1] = 1, y ALUOp[0] = 0, ocurre que out_B = A
  not not3(not_ALUOp0, ALUOp[0]);
  and and3(op2_B, arit, ALUOp[1], not_ALUOp0);

  // Muxes y compl1 del objetivo 4
  mux2_4 mux2_4_A(OP1, kZero, A, op1_A);
  mux2_4 mux2_4_B(out_B, A, B, op2_B);
  compl1 compl1_B(OP2, out_B, cpl);

  // Celdas cal del objetivo 4
  cal cal0(R[0], Cout0, OP1[0], OP2[0], arit, Cin0, ALUOp);
  cal cal1(R[1], Cout1, OP1[1], OP2[1], arit, Cout0, ALUOp);
  cal cal2(R[2], Cout2, OP1[2], OP2[2], arit, Cout1, ALUOp);
  cal cal3(R[3], Cout3, OP1[3], OP2[3], arit, Cout2, ALUOp);

  assign carry = arit ? Cout3 : 1'bx; // Función de carry

  // Función del comportamiento de zero, funciona
  not not4(not_R0, R[0]);
  not not5(not_R1, R[1]);
  not not6(not_R2, R[2]);
  not not7(not_R3, R[3]);
  and and4(zero, not_R0, not_R1, not_R2, not_R3);

  assign sign = arit ? R[3] : 1'bx; // Función de sign
endmodule
