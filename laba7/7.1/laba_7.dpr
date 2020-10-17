 program laba_7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const L_symb= ['A'..'Z', 'a'..'z', ' '];
      L_vow=['a', 'A', 'e','E','i', 'I', 'o','O','u','U', 'y', 'Y'];
      L_Sogl=['q', 'Q', 'w', 'W', 'r', 'R', 't', 'T', 'p', 'P', 's', 'S', 'd',
      'D', 'f', 'F', 'g', 'G', 'h', 'H', 'j', 'J', 'k', 'K', 'l', 'L', 'z', 'Z',
      'x', 'X', 'c', 'C', 'v', 'V', 'b', 'B', 'n', 'N', 'm', 'M'];

var S, S_copy, Sb, Se, S_cur, s_out_1,S_out_2:string;
    i, j: integer;
    flaq, flaq_pr, flaq_vow: boolean;

Procedure DelSpaces(var S_out:string);
var i: integer;
begin
  for i := 1 to length(s_out) do
    if (s_out[i]=' ') and (S_out[i+1]=' ') then
      while (s_out[i+1]=' ') and( S_out<>'') do
        Delete(s_out, i, 1);
   if (s_out<>'') and (s_out[length(s_out)]=' ') then
   begin
    while not(s_out[length(s_out)] in L_symb) do
      Delete(s_out, length(s_out),1);
    Delete(s_out, length(s_out),1);
   end;
   if (s_out<>'') and (s_out[1]=' ') then
   begin
    while not(s_out[1] in L_symb) do
      Delete(s_out, 1,1);
    delete(s_out,1,1);
   end;
end;

Procedure CheckLine(var _s:string; var F:Boolean);
var i: integer;
begin
 f:=true;
 i:=1;
 if length(_s)<>0 then
 begin
   while F and (i<=length(_S)) do
   begin
     if not (_S[i] in L_symb) then
       F:=false;
     inc(i);
   end;
 end;
end;

Procedure CreateCurWord (var _s, _s_cur:string);
begin
  _S_cur:=Copy(_S, 1, Pos(' ', _S)-1);
  if _S_cur='' then
   begin
    _S_cur:=Copy(_S, 1, length(_s));
    Delete(_S, 1, length(_s));
   end
  else
   Delete(_S, 1, Pos(' ', _S));
end;

begin
  readln(S);
  DelSpaces(S);
  CheckLine(S,flaq);
  if not flaq or (S='') then
    writeln('incorrect input')
  else
  begin
   if Copy(S, 1, Pos(' ', S)-1)<>'' then
   begin
    //First word detection
    Sb:=Copy(S, 1, Pos(' ', S)-1);
    Delete(S, 1, Pos(' ', S));
    //Last word detection
    i:=length(s);
    j:=0;
    while (S[i]<>' ') and (i>0) do
    begin
      dec(i);
      inc(j);
    end;
    Se:=Copy(S, i+1, j);
    Delete(S, i,j+1);
    writeln('first word: ', Sb, '; last word: ', Se);
    if UpperCase(Sb)<>UpperCase(Se) then
      s_out_1:=concat(Sb, ' ');
    S_Copy:=Concat(sb,' ', s);
    flaq_vow:=true;
    //Looking for vowels in first word
    for i := 1 to length(sb) do
      if sb[i] in L_vow then
        Flaq_vow:=false;
    //First task
    while S<>'' do
    begin
      //Detecting current word
      CreateCurWord(s,s_cur);
      flaq:=false;
      flaq_pr:=true;

      if UpperCase(S_cur)<>UpperCase(Se) then
      begin
       if not flaq_vow then
        for i:=1 to length(s_cur) do
        begin
         if S_cur[i] in L_vow then
          if Pos(UpperCase(s_cur[i]),UpperCase(Sb))<>0 then
          begin
            for j := 1 to length(Sb) do
            begin
              if Sb[j] in L_vow then
              begin
                if Pos (UpperCase(sb[j]),UpperCase(S_cur))<>0 then
                  flaq:=true
                else
                  flaq_pr:=false;
              end;
            end;

          end
          else
            flaq_pr:=false;
        end
       else
       //case when first word without vowels
        for i := 1 to length(s_cur) do
        begin
          if not (S_cur[i] in L_vow) then
            flaq:=true
          else
            flaq_pr:=false;
        end;
      end;
      if flaq and flaq_pr then
        s_out_1:=Concat(s_out_1, S_cur, ' ');
    end;
    s:=S_copy;
    //Creating line without words similar to the last one
    while S<>'' do
    begin
      CreateCurWord(s,s_cur);
      if UpperCase(S_cur)<>UpperCase(Se) then
        S_out_2:=Concat(S_out_2, S_cur, ' ');
    end;
    //Second Task
    for i := 1 to length(s_out_2) do
    begin
      if S_out_2[i] in L_sogl then
      begin
        j:=i+1;
        while j<=length(s_out_2) do
        begin
          if UpperCase(s_out_2[i])=UpperCase(s_out_2[j]) then
          begin
            delete(s_out_2, j,1);
            dec(j);
          end;
          inc(j)
        end;
      end;
    end;
    //Deleting extra spaces
    DelSpaces(S_out_1);
    DelSpaces(S_out_2);
    //Show result
    if s_out_1='' then
      writeln('строка_1 пуста')
    else
      writeln('строка 1: ', s_out_1);
    if S_out_2<>'' then
      writeln('строка 2: ', s_out_2)
    else
      writeln('строка_2 пуста');
   end
   else
     writeln('you have only 1 word');
  end;
  readln;
end.
