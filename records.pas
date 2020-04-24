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
begin
end;

end.

