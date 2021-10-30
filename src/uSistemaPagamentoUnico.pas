unit uSistemaPagamentoUnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  uSimuladorFinanciamento.Service;

type
  TSistemaPagamentoUnico = class(TForm)
    pCabecalho: TPanel;
    pCorpo: TPanel;
    meCapital: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    meTaxaJuro: TMaskEdit;
    Label3: TLabel;
    mePeriodos: TMaskEdit;
    btnSimular: TButton;
    mmDetalhes: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FServico: TSimuladorFinanciamentoServiceClass;

    class constructor Create;
  protected
    procedure InicializarFormulario;
  public
    class function CriarFormulario(poMainForm: TForm; poServico: TSimuladorFinanciamentoServiceClass): TSistemaPagamentoUnico;
  end;

var
  SistemaPagamentoUnico: TSistemaPagamentoUnico;

implementation

{$R *.dfm}

uses
  uSimuladorFinanciamento.Controller,
  uSimuladorFinanciamento.SistemaPagamentoUnico.Service;

{ TSistemaPagamentoUnico }

class constructor TSistemaPagamentoUnico.Create;
begin
  TSimuladorFinanciamentoController.Instancia.RegistrarFormulario(TSistemaPagamentoUnicoService, TSistemaPagamentoUnico);
end;

class function TSistemaPagamentoUnico.CriarFormulario(poMainForm: TForm; poServico: TSimuladorFinanciamentoServiceClass): TSistemaPagamentoUnico;
begin
  Result := TSistemaPagamentoUnico.Create(poMainForm);
  Result.FServico := poServico;
  Result.InicializarFormulario;
end;

procedure TSistemaPagamentoUnico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSistemaPagamentoUnico.InicializarFormulario;
begin
  Caption := FServico.GetNomeServico;

  mmDetalhes.Clear;

  Show;
end;

end.
