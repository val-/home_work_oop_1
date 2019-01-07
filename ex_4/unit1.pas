unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  FileWork: String;

implementation

{$R *.lfm}

Procedure SaveAs;
begin
 If Form1.SaveDialog1.Execute then
 begin
 Form1.Memo1.Lines.SaveToFile(Form1.SaveDialog1.FileName);
 FileWork:=Form1.SaveDialog1.FileName;
 end;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if FontDialog1.Execute then Memo1.Font:=FontDialog1.Font;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  FileWork:='';
  Memo1.Clear;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    FileWork:=OpenDialog1.FileName;
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  If FileWork='' then SaveAs else Memo1.Lines.SaveToFile(FileWork);
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  SaveAs;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  Close;
end;

end.

