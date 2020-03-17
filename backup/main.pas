unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFormMain }

  TFormMain = class(TForm)
    btnAttention: TButton;
    btnMemory: TButton;
    btnLogic: TButton;
    pnlAttention: TPanel;
    pnlMemory: TPanel;
    pnlLogic: TPanel;
    procedure btnAttentionClick(Sender: TObject);
    procedure btnLogicClick(Sender: TObject);
    procedure btnMemoryClick(Sender: TObject);
  private

  public

  end;

var
  FormMain: TFormMain;

implementation

uses
  attention, memory, logic;

{$R *.lfm}

{ TFormMain }

procedure TFormMain.btnAttentionClick(Sender: TObject);
begin
  FormAttention.ShowModal;
end;

procedure TFormMain.btnLogicClick(Sender: TObject);
begin
  FormLogic.ShowModal;
end;

procedure TFormMain.btnMemoryClick(Sender: TObject);
begin
  FormMemory.ShowModal;
end;

end.

