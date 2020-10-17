program laba_4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
const n=300;
type Tmas=array[1..n] of integer;
var  Amas: Tmas;
     i, pos: integer;


Procedure MasDelSimilar(var Mas: Tmas);
var k: integer;
    i: Integer;
begin
  k:=N;
  while k>1 do
  begin
    for i := 1 to k-1 do
    begin
      if (Mas[i]=Mas[k]) and (Mas[i]<>0) then
        Mas[i]:=0;
    end;
    dec(k);
  end;
end;

begin
  {for i:=1 to n do
  begin
    readln(AMas[i]);
    if AMas[i]=0 then
      pos:=i;
  end;}
  pos:=0;
  for i:=1 to n do
  begin
    Randomize;
    AMas[i]:=Random(6);
    if AMas[i]=0 then
      pos:=i;
  end;
  for i:=1 to N do
    write(AMas[i], ' ');
  writeln; writeln;
  MasDelSimilar(Amas);
  for i:=1 to N do
    write(AMas[i], ' ');
  writeln; writeln;
  for i:=1 to N do
  begin
    if (Amas[i]<>0) or ((pos<>0) and (pos=i)) then
      write(AMas[i], ' ');
  end;
  readln;
end.
