unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, fpjson, jsonparser,
  Menus, BCButton, BGRAThemeButton, BGRATheme, BCMaterialDesignButton;

type

  { TFormMain }

  TFormMain = class(TForm)
    btnAttention: TBCMaterialDesignButton;
    btnMemory: TBCMaterialDesignButton;
    btnLogic: TBCMaterialDesignButton;
    MainMenu: TMainMenu;
    itemHelp: TMenuItem;
    itemAbout: TMenuItem;
    itemRecords: TMenuItem;
    pnlAttention: TPanel;
    pnlMemory: TPanel;
    pnlLogic: TPanel;
    procedure btnAttentionClick(Sender: TObject);
    procedure btnLogicClick(Sender: TObject);
    procedure btnMemoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure itemAboutClick(Sender: TObject);
    procedure itemHelpClick(Sender: TObject);
    procedure itemRecordsClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private

  public

  end;

var
  FormMain: TFormMain;
  targetAttn, targetMem, targetLog: Integer;
  scoreAttn, scoreMem, scoreLog: Integer;

implementation

uses
  attention, memory, logic, help, about, records;

{$R *.lfm}

{ TFormMain }

procedure TFormMain.btnAttentionClick(Sender: TObject);
begin
  FormAttention.Free;
  Application.CreateForm(TFormAttention, FormAttention);
  FormAttention.ShowModal;
end;

procedure TFormMain.btnLogicClick(Sender: TObject);
begin
  FormLogic.Free;
  Application.CreateForm(TFormLogic, FormLogic);
  FormLogic.ShowModal;
end;

procedure TFormMain.btnMemoryClick(Sender: TObject);
begin
  FormMemory.Free;
  Application.CreateForm(TFormMemory, FormMemory);
  FormMemory.ShowModal;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  randomize;
  targetAttn := {1} {<- debug} 40 + random(30);
  targetMem := {1} {<- debug} 50 + random(20);
  targetLog := {1} {<- debug} 30 + random(30);
  scoreAttn := 0;
  scoreMem := 0;
  scoreLog := 0;
end;

procedure TFormMain.itemAboutClick(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TFormMain.itemHelpClick(Sender: TObject);
begin
  FormHelp.ShowModal;
end;

procedure TFormMain.itemRecordsClick(Sender: TObject);
begin
  FormRecords.ShowModal;
end;

procedure TFormMain.MenuItem1Click(Sender: TObject);
begin

end;

end.

