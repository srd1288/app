unit records;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  main, attention;

type

  { TFormRecords }

  TFormRecords = class(TForm)
    lblAttn: TLabel;
    lblMemory: TLabel;
    lblLogic: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  FormRecords: TFormRecords;

implementation

{$R *.lfm}

{ TFormRecords }

procedure TFormRecords.FormCreate(Sender: TObject);
begin
  lblAttn.caption := 'Внимание: ' + IntToStr(scoreAttn) + '/' + IntToStr(targetAttn);
  lblMemory.caption := 'Память: ' + IntToStr(scoreMem) + '/' + IntToStr(targetMem);
  lblLogic.caption := 'Логика: ' + IntToStr(scoreLog) + '/' + IntToStr(targetLog);
end;

procedure TFormRecords.Timer1Timer(Sender: TObject);
begin
  lblAttn.caption := 'Внимание: ' + IntToStr(scoreAttn) + '/' + IntToStr(targetAttn);
  lblMemory.caption := 'Память: ' + IntToStr(scoreMem) + '/' + IntToStr(targetMem);
  lblLogic.caption := 'Логика: ' + IntToStr(scoreLog) + '/' + IntToStr(targetLog);
end;

end.

