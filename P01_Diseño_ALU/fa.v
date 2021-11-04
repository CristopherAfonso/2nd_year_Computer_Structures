// Práctica 1 E.C - Objetivo 2, crear una celda lógica, FA, una Celda A.L
// y probarlas con su Test Bench
// Cristopher Manuel Afonso Mora - alu0101402031

module fa(output wire cout, sum, input wire a, b, cin);
  wire sum1, carry1, carry2;
  assign {carry1, sum1} = a + b;
  assign {carry2, sum} = cin + sum1;
  assign {cout} = carry1 | carry2;
endmodule
