program laba6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const N=7;
      M=(sqr(N)-N)div 2;

type Tmat=array[1..N,1..N] of integer;
     TMas=array[1..M] of integer;

Procedure MatrixOut(var Matr:Tmat);
var i, j:integer;
begin
  for i:=1 to N do
  begin
    for j := 1 to N do
      write(Matr[j,i]:3, ' ');
    writeln;
  end;
end;

Procedure Sort(var mas:Tmas);
var i, temp: integer;
    f: boolean;
begin
 f:=true;
 while f do
 begin
   f:=false;
   for i:=1 to M-1 do
   begin
     if mas[i]>mas[i+1] then
     begin
       Temp:=mas[i];
       mas[i]:=mas[i+1];
       mas[i+1]:=Temp;
       f:=true;
     end;
   end;
 end;
end;


var XMatrix:Tmat;
    MasY: TMas;
    i, j,k: integer;


begin
  Randomize;
  for i:= 1 to N do
  begin
    //Writeln('New matrix line');
    for j := 1 to N do
      XMatrix[j,i]:=Random(19);
      //readln(XMatrix[j,i]);
  end;
  MatrixOut(XMatrix);
  writeln;
  k:=1;
  for i:=1 to N-1 do
  begin
    for j := i+1 to N do
    begin
      MasY[k]:=XMatrix[j,i];
      inc(k);
    end;
  end;
  Sort(MasY);
  k:=1;
  for i:=1 to N-1 do
  begin
    for j := i+1 to N do
    begin
      XMatrix[j,i]:=MasY[k];
      inc(k);
    end;
  end;
  MatrixOut(XMatrix);
  writeln;
  for i := 1 to M do
    Write(MasY[i], '  ');
  readln;
end.
