program Project6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
var x, dif_1, dif, f, eps, det, n:real;
    k: integer;

begin
  writeln('--------------------------------------------------------------------');
  writeln('|   x   |   f(x)   |  eps=10^-2    |  eps=10^-3    |   eps=10^-4   |');
  writeln('|       |          |---------------|---------------|---------------|');
  writeln('|       |          |   f1(x)  |  N |   f2(x)  |  N |   f3(x)  |  N |');
  x:=-0.6;
  while x<-0.6+(19*0.05) do
  begin
    writeln('|-------|----------|----------|----|----------|----|----------|----|');
    write('| ',x:5:2);
    f:=ln(x+sqrt(1+x*x))/(sqrt(1+x*x));
    write(' |',f:9:4);
    eps:=0.01;
    k:=1;
    n:=x;
    det:=1;
    f:=x;
    dif:=1;
    repeat
     begin
      dif_1:=dif;
      n:=n*(-4*x*x)*sqr(k);
      det:=det*(2*k+1)*2*k;
      dif:=n/det;
      f:=f+dif;
      k:=k+1;
     end;
    until abs(abs(dif_1)-abs(dif))<=eps;
    write(' |',f:9:4,' |', k:3);
    eps:=0.001;
    repeat
     begin
      dif_1:=dif;
      n:=n*(-4*x*x)*sqr(k);
      det:=det*(2*k+1)*2*k;
      dif:=n/det;
      f:=f+dif;
      k:=k+1;
     end;
    until abs(abs(dif_1)-abs(dif))<=eps;
    write(' |',f:9:4,' |', k:3);
    eps:=0.0001;
    repeat
     begin
      dif_1:=dif;
      n:=n*(-4*x*x)*sqr(k);
      det:=det*(2*k+1)*2*k;
      dif:=n/det;
      f:=f+dif;
      k:=k+1;
     end;
    until abs(abs(dif_1)-abs(dif))<=eps;
    writeln(' |',f:9:4,' |', k:3,' |');
    x:=x+0.05;
  end;
  writeln('--------------------------------------------------------------------');
  readln;
end.
