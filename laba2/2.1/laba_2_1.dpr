program laba_2_1;

{$APPTYPE CONSOLE}

{$R *.res}
uses
  System.SysUtils;
var x, f, res :real;
    n, k :SmallInt;

begin
  x:=0.6;
  while x<1.11 do
  begin
    n:=10;
    k:=1;
    res:=0;
    while n<16 do
    begin
      if n=10 then
      begin
        while k<n+1 do
        begin
        res:=res+exp((k*x-3)/5)/(ln(k*x)+3/(5+ln(k*x)));
        k:=k+1;
        end;
      end
      else
      begin
        res:=res+exp((k*x-3)/5)/(ln(k*x)+3/(5+ln(k*x)));
        k:=k+1;
      end;
      f:=sqrt(x+(n-1)/n)+res;
      writeln('n: ', n:2, '    x: ',x:3:2, '    f: ',f:5:3);
      n:=n+1;
    end;
    x:=x+0.25;
  end;
  readln;
end.
