unit Geometry;


interface

type
  Point = record
  x, y : Real;
end;

  Line = record
  W : Point;
  Q : Point;
end;

  Triangle = record
  A : Point;
  B : Point;
  C : Point;
end;

function CreatePoint() : Point;
function CreateTriangle(): Triangle;
function GetDistance(M : Point;N : Point): Real;
function GetTrPer(F : Triangle): Real;
function GetSquare(F : Triangle): Real;
procedure TrPerAndSide(F : Triangle; out AB : Real; out BC : Real; out AC : Real; out P : Real);
function CreateLine() : Line;
function CrossTest( p1, p2, p3, p4 : Point): Boolean;
function CrossTriAndLine (F : Triangle; L : Line): Boolean;


implementation

function CreatePoint (): Point;
begin
   Write('Enter Point : ');
   Read(CreatePoint.x);
   Readln(CreatePoint.y);
end;

function CreateTriangle(): Triangle;
begin
   CreateTriangle.A :=  CreatePoint;
   CreateTriangle.B :=  CreatePoint;
   CreateTriangle.C :=  CreatePoint;
end;

function GetDistance(M : Point; N : Point): Real;
begin
   GetDistance := sqrt(M.x*N.x + N.y*M.y);
end;

function GetTrPer(F : Triangle): Real;
var
  AB, BC, AC : Real;
begin
   AB := GetDistance(F.A, F.B);
   BC := GetDistance(F.B, F.C);
   AC := GetDistance(F.A, F.C);
   GetTrPer := AB + BC + AC;
end;

procedure TrPerAndSide(F : Triangle; out AB : Real; out BC : Real; out AC : Real; out P : Real);
begin
   AB := GetDistance(F.A, F.B);
   BC := GetDistance(F.B, F.C);
   AC := GetDistance(F.A, F.C);
   P := GetTrPer(F);
end;

function GetSquare(F : Triangle): Real;
var
   AB, BC, AC, P, P0 : Real;
begin
   TrPerAndSide(F, AB, BC, AC, P);
   P0 := P/2;
   GetSquare  := sqrt(p0 * (p0 - AB) * (p0 - BC) * (p0 - AC));

end;

function CreateLine() : Line;
begin
   Write('Enter Line : ');
   WriteLn('Point W: ');
   ReadLn(CreateLine.W.x, CreateLine.W.y);
   WriteLn('Point Q: ');
   ReadLn(CreateLine.Q.x, CreateLine.Q.y);
end;

function CrossTest( p1, p2, p3, p4 : Point): Boolean;
var
   u: Real;
begin
   u:= ((p1.x-p3.x)*(p3.y-p4.y)-(p1.y-p3.y)*(p3.x-p4.x))/((p1.x-p2.x)*(p3.y-p4.y)-(p1.y-p2.y)*(p3.x-p4.x));
   if (u>=0.0) and (u<=1.0) then
   exit(True);

   exit(False);
end;


function CrossTriAndLine (F : Triangle; L : Line): Boolean;
begin
   if (CrossTest(F.A, F.B, L.W, L.Q)) then
   exit(True);
   if (CrossTest(F.B, F.C, L.W, L.Q)) then
   exit(True);
   if (CrossTest(F.A, F.C, L.W, L.Q)) then
   exit(True);

   exit(False);
end;


end.

