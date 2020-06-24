program project3_verification;

type
  TArray = array of Real;

function PairsSum(const P: TArray): TArray;
var
i: Integer;
begin
  i:= 1;
  SetLength(PairsSum,Length(P) div 2);
  while (i < Length(P)) do
  begin
    PairsSum[i div 2]:= P[i-1]+P[i];
    i+=2;
  end;
end;

var
 A: TArray;
 B: TArray;
 i,N: Integer;

begin
   Writeln('Enter N :');
   Readln(N);
   SetLength(A,N);
   Writeln('Enter massiv :');
   for i:= 0 to N-1 do
      Read(A[i]);
   Readln;
   B:= PairsSum(A);
   if Length(B) = 0 then
      Writeln('the length of array 0');
   for i:= 0 to Length(B)-1 do
      Write(B[i]:0:6, ' ');
   Writeln();

   Readln();
end.
