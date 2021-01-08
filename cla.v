module CLA_Adder(a,b,cin,sum,cout); 
        parameter n=8;
	input[(n-1):0] a,b;
	input cin;
	output reg [(2*n)-1:0] sum;
	output reg cout;
	reg [(2*n)-1:0] p , g ,temp;
        reg [2*n:0] c ;
        integer i;
initial begin
sum = 8'b0000000;
cout = 1'b0;
end
always @(a,b,cin)
begin
 for (i=0;i<n;i=i+1)
    p[i]=a[i]^b[i];	

 for(i=0;i<n;i=i+1)
    g[i]=a[i] & b[i];          

   c[0]=cin;
 for(i=1;i<=n;i=i+1) begin
    temp[i-1] = p[i-1]&c[i-1];
    c[i]=(g[i-1]) | temp[i-1];
 end 

 for(i=0;i<n;i=i+1)
    sum[i]=p[i]^c[i];
	
 cout=c[n];
end

 
		 
endmodule
