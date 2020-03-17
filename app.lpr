program app;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, attention, memory, logic, help;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAttention, FormAttention);
  Application.CreateForm(TFormMemory, FormMemory);
  Application.CreateForm(TFormLogic, FormLogic);
  Application.CreateForm(TFormHelp, FormHelp);
  Application.Run;
end.

