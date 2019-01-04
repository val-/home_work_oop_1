unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    LabelGameOver: TLabel;
    LabelRestart: TLabel;
    Platform: TShape;
    Ball: TShape;
    tmrGame: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LabelRestartClick(Sender: TObject);
    procedure PlatformMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tmrGameTimer(Sender: TObject);
  private
    procedure InitGame;
    procedure GameOver;
  public

  end;

var
  Form1: TForm1;
  SpeedX, SpeedY: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Platform.Left:=X - Platform.Width div 2;
  Platform.Top:=ClientHeight-Platform.Height-2;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DoubleBuffered:=True;
  InitGame;
end;

procedure TForm1.PlatformMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X+Platform.Left, Y+Platform.Top);
end;

procedure TForm1.tmrGameTimer(Sender: TObject);
begin

  Ball.Left:=Ball.Left + SpeedX;
  Ball.Top:=Ball.Top + SpeedY;

  if (Ball.Left <= 0) or (Ball.Left + Ball.Width >= ClientWidth) then SpeedX:=-SpeedX;
  if Ball.Top <= 0 then SpeedY:=-SpeedY;
  if Ball.Top + Ball.Height >= ClientHeight then GameOver;

  if (Ball.Left + Ball.Width >= Platform.Left)
     and (Ball.left <= Platform.Left + Platform.Width)
     and (Ball.Top + Ball.Height >= Platform.Top) then
  begin
    SpeedY:=-SpeedY;
  end;

end;

procedure TForm1.LabelRestartClick(Sender: TObject);
begin
  InitGame;
end;

procedure TForm1.InitGame;
begin
  SpeedX:=-7;
  SpeedY:=-7;
  tmrGame.Enabled:=True;
  LabelGameOver.Visible:=False;
  LabelRestart.Visible:=False;
end;

procedure TForm1.GameOver;
begin
  tmrGame.Enabled:=False;
  LabelGameOver.Visible:=True;
  LabelRestart.Visible:=True;
end;

end.

