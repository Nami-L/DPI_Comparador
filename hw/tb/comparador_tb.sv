`timescale 1ns / 100ps
module tb;

import "DPI-C" function int c_comparador(input byte a, input byte b);

logic [7:0] a;
logic [7:0] b;
logic c;
int valor_referencia;

//intanciar el dut

comparador dut(
    .a(a),
    .b(b),
    .c(c)

);

initial begin
    for (int i =0 ; i < 10; i++)begin
    a = $urandom_range(0,255);
    b = $urandom_range(0,255);
    
    #1
    valor_referencia = c_comparador(a,b); // Modelo de referencia en c

    if (valor_referencia == c) 
    $display(" El valor del RTL=%0d y el valor del Modelo en C=%0d son lo mismo: Valor de a=%0d, b=%0d ",c,valor_referencia,a,b);
    else
    $display(" El valor del RTL=%0d y el valor del Modelo en C=%0d son diferentes: Valor de a=%0d, b=%0d ",c,valor_referencia,a,b);

end
//$finish;
end
  initial begin
    $timeformat(-9, 1, "ns", 10);
    $fsdbDumpvars;                // Synopsys VCS
  end

endmodule


