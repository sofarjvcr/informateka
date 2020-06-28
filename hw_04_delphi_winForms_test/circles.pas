unit circles;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Form1: TLabel;
    Center: TLabel;
    Radius: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private

  public

  end;

  TCircle = record
    X, Y, R : Integer;

  end;


var
  Form1: TForm1;
  C : array of TCircle;

implementation

{$R *.lfm}



{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetLength(C, Length(C)+1);
  C[Length(C)-1].X := StrToInt(Edit1.Text);
  C[Length(C)-1].Y := StrToInt(Edit2.Text);
  C[Length(C)-1].R := StrToInt(Edit3.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, min, max : Integer;
begin
  min := 0;
  max := 0;
  for i:= 1 to Length(C)-1 do begin
    if (C[i].R > C[max].R) then
    max := i;
    if (C[i].R < C[min].R) then
    min := i;
  end;

  Image1.Canvas.Brush.Style := BsSolid;
  Image1.Canvas.Brush.Color := clTeal;
  Image1.Canvas.Pen.Style := PsSolid;
  Image1.Canvas.Pen.Color := clTeal;
  Image1.Canvas.Rectangle(0, 0, Image1.Width, Image1.Height);
  Image1.Canvas.Brush.Style := BsClear;

  for i:= 0 to Length(C)-1 do begin
    if i = min then begin
      Image1.Canvas.Pen.Color := ClBlue;
      Image1.Canvas.Pen.Width := 5;
    end
    else if i = max then begin
      Image1.Canvas.Pen.Color := ClRed;
      Image1.Canvas.Pen.Width := 5;
    end
    else begin
      Image1.Canvas.Pen.Color := ClBlack;
      Image1.Canvas.Pen.Width := 1;
    end;
    Image1.Canvas.Ellipse(C[i].X + C[i].R, C[i].Y + C[i].R, C[i].X - C[i].R, C[i].Y - C[i].R);
  end;

  Image1.Canvas.Pen.Color := ClBlack;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.MoveTo(C[min].X, C[min].Y);
  Image1.Canvas.LineTo(C[max].X, C[max].Y);
end;


end.

