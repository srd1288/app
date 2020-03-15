unit logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

const
  Sequences: array [1..6, 1..6] of string =
    (
    ('1', '2', '3', '4', '5', '6'),
    ('1', '2', '4', '8', '16', '32'),
    ('2', '3', '5', '8', '13', '21'),
    ('1', '3', '6', '10', '15', '21'),
    ('1', '3', '7', '15', '31', '63'),
    ('2', '5', '10', '18', '31', '52')
    );

type

  { TFormLogic }

  TFormLogic = class(TForm)
    btnOk: TButton;
    editInput: TEdit;
    pnlBtn: TPanel;
    pnlScore: TPanel;
    pnlInput: TPanel;
    pnlGame: TPanel;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitSeq;
  private
    FSeqId: Integer;
    FScore: Integer;
  public

  end;

var
  FormLogic: TFormLogic;

implementation

{$R *.lfm}

{ TFormLogic }

procedure TFormLogic.FormCreate(Sender: TObject);
begin
  randomize;
  FScore := 0;
  InitSeq;
end;

procedure TFormLogic.btnOkClick(Sender: TObject);
var
  curVal: string;
begin
  curVal := editInput.text;
  if curVal = Sequences[FSeqId, 6] then begin
    inc(FScore, 5);
  end
  else begin
    dec(FScore, 10);
  end;
  pnlScore.caption := 'Score: ' + IntToStr(FScore);
  InitSeq;
end;

procedure TFormLogic.InitSeq;
begin
  FSeqId := random(6) + 1;
  pnlGame.caption := concat(Sequences[FSeqId, 1], ', ',
  Sequences[FSeqId, 2], ', ', Sequences[FSeqId, 3], ', ', Sequences[FSeqId, 4], ', ',
  Sequences[FSeqId, 5], ', ');
end;

end.

