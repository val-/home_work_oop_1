unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonMirrorPrimary: TButton;
    ButtonMirrorSecondary: TButton;
    ButtonSwitch: TButton;
    StringGrid1: TStringGrid;
    procedure ButtonMirrorPrimaryClick(Sender: TObject);
    procedure ButtonMirrorSecondaryClick(Sender: TObject);
    procedure ButtonSwitchClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonSwitchClick(Sender: TObject);
var
  tmpValue: string;
  i, lastRowIndex, lastColIndex: integer;
begin
  lastColIndex := StringGrid1.ColCount - 1;
  lastRowIndex := StringGrid1.RowCount - 1;
  for i:= 0 to lastColIndex do
  begin
     tmpValue := StringGrid1.Cells[i, 0];
     StringGrid1.Cells[i, 0] := StringGrid1.Cells[i, lastRowIndex];
     StringGrid1.Cells[i, lastRowIndex] := tmpValue;
  end;

end;

procedure TForm1.ButtonMirrorPrimaryClick(Sender: TObject);
var
  tmpValue: string;
  i, j, n: integer;
begin
 if StringGrid1.ColCount = StringGrid1.RowCount then
 begin

  n := StringGrid1.ColCount - 1;

  for i:= 1 to n do
  begin
    for j:= 0 to i do
    begin
      tmpValue := StringGrid1.Cells[i, j];
      StringGrid1.Cells[i, j] := StringGrid1.Cells[j, i];
      StringGrid1.Cells[j, i] := tmpValue;
    end;
  end;

 end;
end;

procedure TForm1.ButtonMirrorSecondaryClick(Sender: TObject);
var
  tmpValue: string;
  i, j, n: integer;
begin
 if StringGrid1.ColCount = StringGrid1.RowCount then
 begin

  n := StringGrid1.ColCount - 1;

  for i:= 0 to n-1 do
  begin
    for j:= 0 to n-i-1 do
    begin
      tmpValue := StringGrid1.Cells[i, j];
      StringGrid1.Cells[i, j] := StringGrid1.Cells[j, i];
      StringGrid1.Cells[j, i] := tmpValue;
    end;
  end;

 end;
end;

end.

