unit attention;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ActnList,
  ExtCtrls, ComCtrls, Math, main;

const
  MAX_LEN = 500;
  MIN_LEN = 50;

type

  { TFormAttention }

  TFormAttention = class(TForm)
    laScore: TLabel;
    laText: TLabel;
    pnlScore: TPanel;
    pnlBtn1: TPanel;
    pnlBtn2: TPanel;
    pnlBtn3: TPanel;
    pnlBtn4: TPanel;
    pnlButtons: TPanel;
    pnlText: TPanel;
    pnlStatus: TPanel;
    bar: TProgressBar;
    timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure InitGame();
    procedure pnlBtn1Click(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure shuffle();
  private
    FColorStr: array[0..20] of string;
    FColorCl: array[0..20] of TColor;
    FLen, FCount, FScore : Integer;
    FCorrect: Integer;
  public
        FMaxScore: Integer;
  end;

var
  FormAttention: TFormAttention;

implementation

{$R *.lfm}

{ TFormAttention }

procedure TFormAttention.FormCreate(Sender: TObject);
var
  fl: TextFile;
  sc: string;
begin         
  randomize;
  FColorStr[0] := 'Красный';
  FColorCl[0] := ClRed;
  FColorStr[1] := 'Cиний';
  FColorCl[1] := ClBlue;
  FColorStr[2] := 'Желтый';
  FColorCl[2] := ClYellow;
  FColorStr[3] := 'Зеленый';
  FColorCl[3] := ClGreen;
  FColorStr[4] := 'Серый';
  FColorCl[4] := ClGray;
  FColorStr[5] := 'Белый';
  FColorCl[5] := ClWhite;
  FColorStr[6] := 'Черный';
  FColorCl[6] := ClBlack;
  FColorStr[7] := 'Фиолетовый';
  FColorCl[7] := ClPurple;
  FLen := MAX_LEN;
  FScore := 0;
  FMaxScore := 0;
  {
  AssignFile(fl, 'rattn.txt');
  Reset(fl);
  Readln(fl, sc);
  FMaxScore := StrToInt(sc);
  CloseFile(fl);
  }
  InitGame;
end;

procedure TFormAttention.InitGame();
begin
  bar.Max := FLen;
  bar.Position := 0;
  FCount := 0;
  laScore.caption := Concat('Score: ', IntToStr(FScore));
  shuffle;
  pnlBtn1.color := FColorCl[0];
  pnlBtn2.color := FColorCl[1];
  pnlBtn3.color := FColorCl[2];
  pnlBtn4.color := FColorCl[3];
  FCorrect := random(4);
  laText.Font.Color := FColorCl[random(4)];
  laText.Caption := FColorStr[FCorrect];
end;

procedure TFormAttention.pnlBtn1Click(Sender: TObject);
var
  fl: TextFile;
begin
  if StrToInt((Sender as TPanel).caption) - 1 = FCorrect then
  begin
    FScore := FScore + 1;
    FLen := max(FLen - 5, MIN_LEN);
  end
  else
  begin
    FScore := max(0, FScore - 10);
    FLen := min(FLen + 5, MAX_LEN);
  end;
  FMaxScore := max(FScore, FMaxScore);
  scoreAttn := max(scoreAttn, FMaxScore);
  {
  AssignFile(fl, 'rattn.txt');
  Rewrite(fl);
  Writeln(fl, IntToStr(FMaxScore));
  CloseFile(fl);
  }
  initGame();
end;

procedure TFormAttention.shuffle;
var
  i, j: Integer;
  tmpc: TColor;
  tmps: string;
begin
  for i:=0 to 7 do
  begin
    j := Random(7);
    tmpc := FColorCl[j];
    FColorCl[j] := FColorCl[i];
    FColorCl[i] := tmpc;
    tmps := FColorStr[j];
    FColorStr[j] := FColorStr[i];
    FColorStr[i] := tmps;
  end;
end;

procedure TFormAttention.timerTimer(Sender: TObject);
begin
  inc(FCount);
  bar.Position := bar.Position + 1;
  if (FCount = FLen) then
  begin
    FScore := max(0, FScore - 10);
    FLen := min(FLen + 5, MAX_LEN);
    initGame();
  end;
end;

end.

