unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormAbout }

  TFormAbout = class(TForm)
    memoAbout: TMemo;
  private

  public

  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.lfm}

end.

