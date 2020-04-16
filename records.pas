unit records;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormRecords }

  TFormRecords = class(TForm)
    lblAttn: TLabel;
    lblMemory: TLabel;
    lblLogic: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormRecords: TFormRecords;

implementation

{$R *.lfm}

{ TFormRecords }

procedure TFormRecords.FormCreate(Sender: TObject);
var
  sattn, slog, smem: Integer;
  fl: TextFile;
  sc: string;
begin
  AssignFile(fl, 'rmemory.txt');
  Reset(fl);
  Readln(fl, sc);
  lblMemory.Caption := 'Память: ' + sc;
  CloseFile(fl);
  AssignFile(fl, 'rattn.txt');
  Reset(fl);
  Readln(fl, sc);
  lblAttn.Caption := 'Внимание: ' + sc;
  CloseFile(fl);
  AssignFile(fl, 'rlogic.txt');
  Reset(fl);
  Readln(fl, sc);
  lblLogic.Caption := 'Логика: ' + sc;
  CloseFile(fl);
end;

end.

