program laba7_2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const numbers= ['-','1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

var s1, s2: string;
    n1, n2:integer;

Procedure DelSpaces(var S:string);
begin
   if s<>'' then
    while (s<>'') and not (s[1] in numbers) do
      Delete(s,1,1);
   if s<>'' then
    while (s<>'') and not (s[length(s)] in numbers) do
      Delete(s,length(s),1);

end;

Function check(s:string):boolean;
var i:integer;
begin
  result:=true;
  for i := 1 to length(s) do
   if not(s[i] in numbers) then
     result:=false;
  if S='' then
    result:=false;
  if (pos('-',s)<>1) and (pos('-',s)<>0) then
    result:=false;
end;

begin
  writeln('Enter first number'); readln(s1);
  writeln('Enter second number'); readln(s2);
  DelSpaces(s1);
  DelSpaces(s2);
  if check(s1) and check(s2) then
  begin
    n1:=StrToInt(s1);
    n2:=StrToInt(s2);
    if n1-n2>=0 then
    begin
      if n1-n2=0 then
        writeln('Разность между числами ', n1, ' и ', n2, ' является нулевым целым числом')
      else
        writeln('Разность между числами ', n1, ' и ', n2, ' является положительным целым числом ', n1-n2);
    end
    else
      writeln('Разность между числами ', n1, ' и ', n2, ' является отрицательным целым числом ', n1-n2);
  end
  else
   writeln('incorrent input');
  readln;
end.
