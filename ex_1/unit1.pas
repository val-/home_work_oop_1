unit Unit1;

{$mode objfpc}{$H+}

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,d,x1,x2:double;
begin
  a := StrToFloat(Edit1.Text);
  b := StrToFloat(Edit2.Text);
  c := StrToFloat(Edit3.Text);
  d := b*b-4*a*c;
  if d>=0 then
    begin
    x1 := (-b+sqrt(d))/(2*a);
    x2 := (-b-sqrt(d))/(2*a);
    Memo1.Lines.Add('Result:');
    Memo1.Lines.Add('x1='+FloatToStrF(x1,ffGeneral,7,2));
    Memo1.Lines.Add('x2='+FloatToStrF(x2,ffGeneral,7,2));
    end;
  if d<0 then
    Memo1.Lines.Add('Solution not found');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Memo1.Clear;
end;

end.
