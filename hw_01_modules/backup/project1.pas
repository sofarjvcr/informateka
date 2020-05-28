program project1;

uses  geometry;

var
  T: Triangle;

begin
  T:= CreateTriangle();


  WriteLn('AB = ', GetDistance(T.A, T.B):0:6);
  WriteLn('BC = ', GetDistance(T.B, T.C):0:6);
  WriteLn('AC = ', GetDistance(T.A, T.C):0:6);


  WriteLn('Peremetr = ', GetTrPer(T):0:6);
  WriteLn('Square = ', GetSquare(T):0:6);


  Readln();
end.

