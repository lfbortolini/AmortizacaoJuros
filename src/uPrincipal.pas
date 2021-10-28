unit uPrincipal;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions;

type
  TmfPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miSistemaPagamentoUnico: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mfPrincipal: TmfPrincipal;

implementation

{$R *.dfm}

end.
