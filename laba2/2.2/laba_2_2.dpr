program laba_2_2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
var x, n, y, a :real;
    k: integer;

begin
  x:=0.5;
  while x<=0.80 do
  begin
    a:=x*x;
    y:=1;
    write('Max power(natural, min 5)=');
    read(n);
    if n>=5 then
    begin
     n:=Round(n);
     writeln('(~',n:2:1,')');
     k:=2;
     while k<>n+1 do
     begin
       y:=ln(exp(x)/k)+y;
       y:=a/y;
       a:=a*x;
       k:=k+1;
     end;
     writeln('x=', x:2:2, '     y=',y:18:14);
     x:=x+0.05;
    end
    else
     writeln('error: n less than 5');
  end;
  readln;
  readln;
end.
