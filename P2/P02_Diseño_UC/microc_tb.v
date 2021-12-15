// Practica 2 E.C - Paola Janeth Astudillo Capote - Cristopher Manuel Afonso Mora
//                  alu0101337418                 - alu0101402031
// Archivo "microc_tb.v": Contiene el testbench del archivo "microc_tb.v"

`timescale 1 ns/10 ps // Fija la unidad de tiempo de simulación y su precision

module microc_tb; // Instanciamos el modulo a testear
  // Declaramos las señales
  wire [5:0] Test_opcode;
  reg[2:0] Test_op;
  reg clk, reset, Test_s_ret, Test_s_rre, Test_s_inc, Test_s_inm, Test_we3, Test_wez;
  wire t_z;

  microc t_microc(clk, reset, Test_s_ret, Test_s_rre, Test_s_inc, Test_s_inm, Test_we3, Test_wez, Test_op, t_z, Test_opcode);
  
  always 
  begin
    clk <= 1;
    #20;
    clk <= 0;
    #20;
  end

  initial 
    begin
      reset <= 1;
      #10;
      reset <= 0;
      #10;
    end

  initial
    begin
      $dumpfile("microc.vcd");
      $dumpvars;

      Test_s_inm = 1;
      Test_we3 = 1;
      Test_op = 3'b000;
      Test_wez = 0;
      Test_s_inc = 1;
      Test_s_rre = 0;
      Test_s_ret = 0;
      #40

      Test_s_inm = 1;
      Test_we3 = 1;
      Test_op = 3'b000;
      Test_wez = 0;
      Test_s_inc = 1;
      Test_s_rre = 0;
      Test_s_ret = 0;
      #40

      $finish;
    end 
endmodule