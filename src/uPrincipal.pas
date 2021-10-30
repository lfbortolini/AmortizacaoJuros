unit uPrincipal;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions;

type
  TmfPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miAmortizacaoJuros: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    procedure CriarItensMenu;
    procedure CriarServico(Sender: TObject);
  public
    { Public declarations }
  end;

var
  mfPrincipal: TmfPrincipal;

implementation

{$R *.dfm}

uses
  uSimuladorFinanciamento.Service,
  uSimuladorFinanciamento.Controller,
  uSistemaPagamentoUnico;

procedure TmfPrincipal.CriarItensMenu;
var
  oService: TSimuladorFinanciamentoServiceClass;
  oMenuItem: TMenuItem;
begin
  for oService in TSimuladorFinanciamentoController.Instancia.GetServices do
  begin
    oMenuItem := mmPrincipal.CreateMenuItem;
    oMenuItem.Caption := oService.GetNomeServico;
    oMenuItem.Tag := LongInt(oService);
    oMenuItem.OnClick := CriarServico;

    miAmortizacaoJuros.Add(oMenuItem);
  end;
end;

procedure TmfPrincipal.CriarServico(Sender: TObject);
var
  oService: TSimuladorFinanciamentoServiceClass;
begin
  oService := TSimuladorFinanciamentoServiceClass(LongInt(TMenuItem(Sender).Tag));
  TSistemaPagamentoUnico.CriarFormulario(Self, oService);
end;

procedure TmfPrincipal.FormCreate(Sender: TObject);
begin
  CriarItensMenu;
end;

end.
