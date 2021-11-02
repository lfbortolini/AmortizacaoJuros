unit uSistemaPagamentoUnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  uSimuladorFinanciamento.Service,
  uSimuladorFinanciamento.Periodos,
  uSimuladorFinanciamento.Erros;

type
  TSistemaPagamentoUnico = class(TForm)
    pCabecalho: TPanel;
    pCorpo: TPanel;
    btnSimular: TButton;
    leCapital: TLabeledEdit;
    leTaxaJuro: TLabeledEdit;
    lePeriodo: TLabeledEdit;
    lvDetalhes: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimularClick(Sender: TObject);
  private
    FServicoClass: TSimuladorFinanciamentoServiceClass;
    FServico: TSimuladorFinanciamentoService;

    class constructor Create;
    procedure SimularPagamentoUnico;
    procedure ExibirDadosPagamentoUnico(poListaPeriodos: TListaPeriodos);
    procedure ExibirMensagemErroPagamentoUnico(poListaErros: TListaErros);
  protected
    procedure InicializarFormulario;
  public
    destructor Destroy; override;
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

procedure TSistemaPagamentoUnico.btnSimularClick(Sender: TObject);
begin
  SimularPagamentoUnico;
end;

class constructor TSistemaPagamentoUnico.Create;
begin
  TSimuladorFinanciamentoController.Instancia.RegistrarFormulario(TSistemaPagamentoUnicoService, TSistemaPagamentoUnico);
end;

class function TSistemaPagamentoUnico.CriarFormulario(poMainForm: TForm; poServico: TSimuladorFinanciamentoServiceClass): TSistemaPagamentoUnico;
begin
  Result := TSistemaPagamentoUnico.Create(poMainForm);
  Result.FServicoClass := poServico;
  Result.InicializarFormulario;
end;

destructor TSistemaPagamentoUnico.Destroy;
begin
  FreeAndNil(FServico);

  inherited;
end;

procedure TSistemaPagamentoUnico.ExibirDadosPagamentoUnico(poListaPeriodos: TListaPeriodos);
var
  oPeriodo: TPeriodo;

  procedure AdicionarItemLista(psCapiton: String; poPeriodo: TPeriodo);
  var
    oListItem: TListItem;
  begin
    oListItem := lvDetalhes.Items.Add;
    oListItem.Caption := psCapiton;
    oListItem.SubItems.Add(poPeriodo.ValorJurosToString);
    oListItem.SubItems.Add(poPeriodo.ValorAmortizacaoToString);
    oListItem.SubItems.Add(poPeriodo.ValorPagamentoToString);
    oListItem.SubItems.Add(poPeriodo.SaldoDevedorToString);
    oListItem.Data := nil;

    if psCapiton = '0' then
      oListItem.GroupID := 0
    else if psCapiton = 'Totais' then
      oListItem.GroupID := 2
    else
      oListItem.GroupID := 1;
  end;
begin
  lvDetalhes.Clear;

  for oPeriodo in poListaPeriodos do
  begin
    AdicionarItemLista(IntToStr(oPeriodo.Periodo), oPeriodo);
  end;

  oPeriodo := FServico.CalcularTotaisFinanciamento;
  AdicionarItemLista('Totais', oPeriodo);

  FreeAndNil(oPeriodo);
end;

procedure TSistemaPagamentoUnico.ExibirMensagemErroPagamentoUnico(poListaErros: TListaErros);
begin
  MessageBox(Handle, PChar(poListaErros.ToMessage), 'Aviso', MB_OK);
  leCapital.SetFocus;
end;

procedure TSistemaPagamentoUnico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSistemaPagamentoUnico.InicializarFormulario;
begin
  Caption := FServicoClass.GetNomeServico;
  FServico := FServicoClass.LazyLoadIt;

  lvDetalhes.Clear;

  Show;
end;

procedure TSistemaPagamentoUnico.SimularPagamentoUnico;
var
  nCapital, nTaxaJuro: Extended;
  nPeriodos: SmallInt;
  oListaPeriodos: TListaPeriodos;
  oListaErros: TListaErros;
begin
  nCapital := StrToFloatDef(leCapital.Text, 0.0);
  nTaxaJuro := StrToFloatDef(leTaxaJuro.Text, 0.0);
  nPeriodos := StrToIntDef(lePeriodo.Text, 0);

  try
    oListaErros := FServico.ValidarDadosFinanciamento(nCapital, nTaxaJuro, nPeriodos);

    if oListaErros.Count > 0 then
    begin
      ExibirMensagemErroPagamentoUnico(oListaErros);
      Exit;
    end;
  finally
    FreeAndNil(oListaErros);
  end;

  try
    oListaPeriodos := FServico.CalcularFinanciamento(nCapital, nTaxaJuro, nPeriodos);
    ExibirDadosPagamentoUnico(oListaPeriodos);
  finally
    FreeAndNil(oListaPeriodos);
  end;
end;

end.
