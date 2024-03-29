module minutos(clock, clock1, UP, DOWN, SW15, SW16, SW17, clockOUT, a, b, c, d, e, f, g, a1, b1, c1, d1, e1, f1, g1);
input clock, UP, DOWN, SW15, SW16, clock1, SW17;
reg [5:0]minuto;

output reg clockOUT, a, b, c, d, e, f, g, a1, b1, c1, d1, e1, f1, g1;
reg estado, jafoi;
reg [31:0]count;
initial minuto = 0;
initial count = 0;

always @(posedge clock) begin
	if(SW16 == 0 && SW17 == 0)
		estado = 0;
	else if(SW15 == 0 && SW16 == 0 && SW17 == 1)
		estado = 1;
	
	
	case(clock1)
		1 :	if(estado == 0)
				count = count + 1;
	endcase
	
	case(estado)
		0 : begin				
				if(count >= 1)begin
					minuto <= minuto + 1; 
					count = 0;
					end
				
					
				if(minuto >= 60)begin
					clockOUT = 1;
					minuto <= 0;
					end
				else
					clockOUT = 0;
			end			
		1 : begin
				if(UP == 0)begin
					if(minuto==59)
						minuto <= 0;
					else
						minuto <= minuto + 1;
					jafoi <= 0; end
				else 
				if(DOWN== 0)begin
					if(minuto==0)
						minuto <= 59;
					else
						minuto <= minuto - 1;
					jafoi <= 0; end
				else if(UP==0 && DOWN==0)
					estado = 0;
							
			end			
	endcase	
	
	case(minuto%10)
			0 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 1 ;end
			1 : begin a <= 1 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 1 ; g <= 1 ;end
			2 : begin a <= 0 ; b <= 0 ; c <= 1 ; d <= 0 ; e <= 0 ; f <= 1 ; g <= 0 ;end
			3 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 1 ; g <= 0 ;end
			4 : begin a <= 1 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 0 ; g <= 0 ;end
			5 : begin a <= 0 ; b <= 1 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 0 ; g <= 0 ;end
			6 : begin a <= 0 ; b <= 1 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 0 ;end
			7 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 1 ; g <= 1 ;end
			8 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 0 ;end
			9 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 0 ; g <= 0 ;end
		endcase
	case(minuto/10)
			0 : begin a1 <= 0 ; b1 <= 0 ; c1 <= 0 ; d1 <= 0 ; e1 <= 0 ; f1 <= 0 ; g1 <= 1 ;end
			1 : begin a1 <= 1 ; b1 <= 0 ; c1 <= 0 ; d1 <= 1 ; e1 <= 1 ; f1 <= 1 ; g1 <= 1 ;end
			2 : begin a1 <= 0 ; b1 <= 0 ; c1 <= 1 ; d1 <= 0 ; e1 <= 0 ; f1 <= 1 ; g1 <= 0 ;end
			3 : begin a1 <= 0 ; b1 <= 0 ; c1 <= 0 ; d1 <= 0 ; e1 <= 1 ; f1 <= 1 ; g1 <= 0 ;end
			4 : begin a1 <= 1 ; b1 <= 0 ; c1 <= 0 ; d1 <= 1 ; e1 <= 1 ; f1 <= 0 ; g1 <= 0 ;end
			5 : begin a1 <= 0 ; b1 <= 1 ; c1 <= 0 ; d1 <= 0 ; e1 <= 1 ; f1 <= 0 ; g1 <= 0 ;end
			6 : begin a1 <= 0 ; b1 <= 1 ; c1 <= 0 ; d1 <= 0 ; e1 <= 0 ; f1 <= 0 ; g1 <= 0 ;end
			7 : begin a1 <= 0 ; b1 <= 0 ; c1 <= 0 ; d1 <= 1 ; e1 <= 1 ; f1 <= 1 ; g1 <= 1 ;end
			8 : begin a1 <= 0 ; b1 <= 0 ; c1 <= 0 ; d1 <= 0 ; e1 <= 0 ; f1 <= 0 ; g1 <= 0 ;end
			9 : begin a1 <= 0 ; b1 <= 0 ; c1 <= 0 ; d1 <= 0 ; e1 <= 1 ; f1 <= 0 ; g1 <= 0 ;end
		endcase
	
end
endmodule