program laba_1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
var a, b, x, y, step: real;


begin
  writeln('Enter a, b, step');
  readln(a, b, step);
  x:=a;
  if (step<>0) and (((a>b) and (step<0)) or ((a<b) and (step>0))) then
  begin
   repeat
    if (abs(x)>abs(step)/10000) then
    begin
     y:=ln(exp(ln(x*x+pi)/3))+arctan(x/3)+exp(5/3)/x;
     writeln(x:7:5,'   ',y:7:5);
    end
    else
     writeln('Error: division by 0');
    x:=x+step;
   until ((x>b) and (step>0)) or ((x<b) and (step<0));
   if ((x>b) and (step>0)) or ((x<b) and (step<0)) then
    begin
      if (abs(x)-abs(step)<abs(b)) and (abs(abs(x-step)-abs(b))>abs(step/10000)) then
      begin
        if (abs(b)-abs(x)<abs(step)) and (abs(b)>abs(step)/10000) then
        begin
          x:=b;
          y:=ln(exp(ln(x*x+pi)/3))+arctan(x/3)+exp(5/3)/x;
          writeln(x:7:5, '   ', y:7:5);
        end;
      end;
    end;
  end
  else
  begin
   writeln('Error');
  end;
readln;
end.
