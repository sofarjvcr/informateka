unit Geometry;


interface

type
  Point = record;
  x, y : Real;

  Line = record;
  A : Point;
  B : Point;

  Triangle = record;
  A : Point;
  B : Point;
  C : Point;

function CreatePoint() : Point;
function CreateTriangle(): Triangle;
function GetDistance(M : Point;N : Point): Real;
function GetTrPer(F : Triangle): Real;
function GetSquare(F : Triangle): Real;
procedure TrPerAndSide(F : Triangle; out AB : Real; out BC : Real; out AC : Real; out P : Real);


implementation

function CreatePoint (): Point;
begin
   Write('Enter Point : ');
   Readln(CreatePoint.x ;CreatePoint.y);
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


end.

