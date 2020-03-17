unit memory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Math;

const
  MAX_GAME_SIZE = 10;

type

  { TFormMemory }

  TFormMemory = class(TForm)
    btnDone: TButton;
    lblScore: TLabel;
    pnlBtn: TPanel;
    pnlScore: TPanel;
    pnlGame: TPanel;
    timerGame: TTimer;
    procedure btnDoneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerGameTimer(Sender: TObject);
  private
    FShapes: array[1..MAX_GAME_SIZE, 1..MAX_GAME_SIZE] of TShape;
    FMask: array[1..MAX_GAME_SIZE, 1..MAX_GAME_SIZE] of Integer;
    FMarked: array[1..MAX_GAME_SIZE, 1..MAX_GAME_SIZE] of Integer;
    FScore: Integer;
    FCntBlocks: Integer;
    FHeight, FWidth: Integer;
    FCreatedField: Boolean;
    FGameStarted: Boolean;
    FTimerSteps, FCurTimerStep, FTimerStep: Integer;
    procedure InitField;
    procedure HideField;
    procedure ShapeClick(Sender: TObject);
    procedure ChangeColor(i, j: Integer; clr: TColor);
    procedure DestroyField;
  public

  end;

var
  FormMemory: TFormMemory;

implementation

{$R *.lfm}

{ TFormMemory }

procedure TFormMemory.FormCreate(Sender: TObject);
begin
  randomize;
  FCntBlocks := 5;
  FHeight := 5;
  FWidth := 5;
  FScore := 0;
  FTimerSteps := 500;
  InitField;
end;

procedure TFormMemory.timerGameTimer(Sender: TObject);
begin
  inc(FCurTimerStep, FTimerStep);
  if (FCurTimerStep = FTimerSteps) then
  begin
    FTimerStep := 0;
    FCurTimerStep := 0; 
    btnDone.caption := 'ГОТОВО';
    HideField;
  end;
end;

procedure TFormMemory.ChangeColor(i, j: Integer; clr: TColor);
begin
  FShapes[i, j].Brush.Color := clr;
end;

procedure TFormMemory.btnDoneClick(Sender: TObject);
var
  i, j, cntGood, cntBad: Integer;
begin
  cntGood := 0;
  cntBad := 0;
  if FGameStarted then
  begin
    FGameStarted := False;
    btnDone.caption := 'OK';
    for i := 1 to FHeight do
    begin
      for j := 1 to FWidth do
      begin
        if (FMarked[i, j] xor FMask[i, j] = 0) then
        begin
          ChangeColor(i, j, clGreen);
          if FMarked[i, j] = 1 then
          begin
            inc(cntGood);
          end;
        end
        else
        begin
          ChangeColor(i, j, clRed);
          inc(cntBad);
        end;
      end;
    end;
    FScore := cntGood - cntBad * 2;
    lblScore.caption := Concat('Score: ', IntToStr(FScore));
  end
  else if (btnDone.caption = 'OK') then begin
    btnDone.caption := 'ГОТОВО';
    DestroyField;
    InitField;
  end;
end;

procedure TFormMemory.InitField;
var
  i, j: Integer;
begin
  if not FCreatedField then
  begin
    FTimerStep := 1;
    FTimerSteps := max(FTimerSteps - 10, 200);
    btnDone.caption := 'ЖДЕМ...';
    for i := 1 to FCntBlocks do
    begin
      FMask[random(FHeight) + 1, random(FWidth) + 1] := 1;
    end;
    for i := 1 to FHeight do
    begin
      for j := 1 to FWidth do
      begin
        FShapes[i, j] := TShape.create(self);
        FShapes[i, j].parent := pnlGame;
        FShapes[i, j].width := pnlGame.width div FWidth;
        FShapes[i, j].height := pnlGame.height div FHeight;
        FShapes[i, j].left := FShapes[i, j].width * (j - 1);
        FShapes[i, j].top := FShapes[i, j].height * (i - 1);
        FShapes[i, j].shape := stRectangle;
        FShapes[i, j].OnClick := @ShapeClick;
        ChangeColor(i, j, clWhite);
        FMarked[i, j] := 0;
        if FMask[i, j] = 1 then
        begin
          ChangeColor(i, j, clBlack);
        end;
      end;
    end;
    FCreatedField := True;
  end;
end;

procedure TFormMemory.DestroyField;
var
  i, j: Integer;
begin
  if FCreatedField then begin
    FCreatedField := False;
    for i := 1 to FHeight do
    begin
      for j := 1 to FWidth do
      begin
        FShapes[i, j].free;
      end;
    end;
  end;
end;

procedure TFormMemory.HideField;
var
  i, j: Integer;
begin
  if FCreatedField then
  begin
    FGameStarted := True;
    for i := 1 to FHeight do
    begin
      for j := 1 to FWidth do
      begin
        ChangeColor(i, j, clWhite);
      end;
    end;
  end;
end;

procedure TFormMemory.ShapeClick(Sender: TObject);
var
  i, j: Integer;
begin
  if FGameStarted then
    begin
    i := (Sender as TShape).Top div (Sender as TShape).Height + 1;
    j := (Sender as TShape).Left div (Sender as TShape).Width + 1;
    if FMarked[i, j] = 1 then
    begin
      ChangeColor(i, j, clWhite);
      FMarked[i, j] := 0;
    end
    else
    begin
      ChangeColor(i, j, clGray);
      FMarked[i, j] := 1;
    end;
  end;
end;

end.
