program Laba3_dop;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils;
var
  eps, prev_x, x1, x2, x3, res1: real;

begin
  eps:=0.0001;
  x3:=0;
  x2:=1;
  repeat
   x1:=x3;
   x3:=x1-((cos(x1)-x1*x1)*(x2-x1)/((cos(x2)-x2*x2)-(cos(x1)-x1*x1)));
  until abs(x3-x1)<=eps;
  res1:=x3;
  writeln('Secant method: ~ ', res1:10:8);
  x1:=0;
  x2:=1;
  x3:=1;
  repeat
   prev_x:=x3;
   x3:=(x2+x1)/2;
   if (cos(x1)-x1*x1)*(cos(x3)-x3*x3)<0 then
    x2:=x3
   else
    x1:=x3;
  until abs(prev_x-x3)<=eps ;
  writeln('Bisection method: ~ ', x3:10:8);
  writeln('Difference between method''s x: ~ ', abs(res1-x3):10:8);
  writeln;
  writeln('SecantMethodFunc: ~ ', (cos(res1)-res1*res1):10:8);
  writeln('BisectionMethodFunc: ~ ', (cos(x3)-x3*x3):10:8);
  writeln('Difference between functions: ~ ', (cos(res1)-res1*res1)-(cos(x3)-x3*x3):10:8);

  readln;
end.
