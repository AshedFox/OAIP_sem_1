program kosti;

uses
  System.SysUtils;

const
  n=5;

type
  Tmas=array[1..n] of integer;

var
  a:tmas;
  s1_final,s2_final:integer;
  flag:boolean;

procedure fillTheMas;
var i:integer;
begin
  randomize;
  for  i:= 1 to n do
    begin
      a[i]:=random(5)+1;
    end;

end;


procedure printTheMas;
var i:integer;

begin
  for i := 1 to n do
    begin
      write(a[i]:3);
    end;
end;

Function NumOfSim ( Count : Tmas) : integer;
var i : integer;
  Del : integer;
begin
 Result:=0;
 Del:=0;
  for I := 1 to n do
  if Count[i] > 1 then
  begin
  Result:=Result + Count[i]*i;
  Del:=Del+count[i];
  end;
  if Del = 0 then
    result:=10
  else
    Result:=Result*10 div Del;
end;

Function Schet(const Arr : Tmas) : integer;
var
 Count : Tmas;
 i, j, m, Pair, PairNum : integer;
begin
Result:=1;
for i := 1 to n do
 Count[i]:=0;
for i := 1 to n do
 inc(Count[Arr[i]]);
 m:=NumOFSim(count);
  Pair:=Count[1];
  Pairnum:=1;
  for i := 2 to n do
    if Pair < count[i] then
    begin
      Pair := count[i];
      PairNum := i;
    end;
    if Pair > 2 then
    begin
       if Pair > 3 then
        begin
          if Pair > 4 then
          begin
            if Pair = 5 then
              Result:=7;
          end
            else Result:=6
        end
          else
            begin
             count[PairNum]:=Count[PairNum]-3;
             for j := 1 to n do
                if count [j] = 2 then
                  Result:=5;
                if result = 1 then
                  Result:=4;
            end;
    end
    else
    if Pair = 2 then
    begin
      Count[PairNum]:=Count[PairNum]-2;
      for j := 1 to n do
        if count[j]=2 then
          result:=3;
      if result = 1 then
        result:=2;
    end;
    if m > 1 then
      Result:=Result*m;
end;

procedure printTheSum;
var s:integer;
begin
  s:=schet(a);
  if not(flag) then
  begin
    s1_final:=s1_final+s;
    flag:=true;
  end
  else if flag then
  begin
    s2_final:=s2_final+s;
    flag:=false;
  end;



  write(s:6);

end;


procedure playerMove;
begin
readln; //ход игрока
fillTheMas; //заполнение массива

write('| ');
printTheMas;
write('    |');

printTheSum;
write('   ');

 //ход игрока

fillTheMas; //заполнение массива

write('| ');
printTheMas;
write('    |');

printTheSum;
write('   |');
writeln;
write('|--------------------|---------|--------------------|---------|');
end;


begin
writeln('+-------------------------------------------------------------+');
writeln('|         Первый игрок         |          Второй игрок        |');
writeln('|------------------------------|------------------------------|');
writeln('|     Выпавшая       |  баллы  |     Выпавшая       |  баллы  |');
writeln('| Последовательность |         | Последовательность |         |');
  write('|--------------------|---------|--------------------|---------|');

//Первый ход
playerMove;

//Второй ход
playerMove;

//Третий ход
playerMove;

//Четвертый ход
playerMove;

//Пятый ход
playerMove;
writeln;
writeln('|                    |   ',s1_final: 3,'   |                    |   ',s2_final:3,'   |');
writeln('+-------------------------------------------------------------+');
readln;

end.
