unit uSimuladorFinanciamento.SistemaPagamentoUnico.Service;

interface

uses
  uSimuladorFinanciamento.Service,
  uSimuladorFinanciamento.Periodos,
  uSimuladorFinanciamento.Erros;

type
  TSistemaPagamentoUnicoService = class(TSimuladorFinanciamentoService)
  private
    const C_NOME_SERVICO = 'Sistema de Pagamento único';
  protected
    class constructor Create;
  public
    class function GetNomeServico: String; override;
    class function LazyLoadIt: TSimuladorFinanciamentoService; override;

    function CalcularFinanciamento(const peCapital, peTaxaJuro: Extended; const pePeriodo: SmallInt): TListaPeriodos; override;
    function CalcularTotaisFinanciamento: TPeriodo; override;
    function ValidarDadosFinanciamento(const peCapital, peTaxaJuro: Extended; const pePeriodo: SmallInt): TListaErros; override;
  end;

implementation

uses
  uSimuladorFinanciamento.Controller,
  Math;

{ TSistemaPagamentoUnicoService }

function TSistemaPagamentoUnicoService.CalcularFinanciamento(const peCapital, peTaxaJuro: Extended; const pePeriodo: SmallInt): TListaPeriodos;
var
  I: SmallInt;
  oListaPeriodos: TListaPeriodos;
  oPeriodo, oPeriodoAtual: TPeriodo;
begin
  Capital := peCapital;
  TaxaJuro := peTaxaJuro;
  Periodo := pePeriodo;
  ValorTotalJuros := 0;

  oListaPeriodos := TListaPeriodos.Create;

  // Adiciona a primeiro periodo onde temos somente o saldo devedor
  oPeriodo := TPeriodo.Create;
  oPeriodo.SaldoDevedor := Capital;
  oListaPeriodos.Add(oPeriodo);

  for I := 1 to Periodo do
  begin
    oPeriodoAtual := TPeriodo.Create;
    oPeriodoAtual.Periodo := I;
    oPeriodoAtual.ValorAmortizacao := 0;
    oPeriodoAtual.ValorPagamento := 0;
    oPeriodoAtual.ValorJuros := RoundTo((oPeriodo.SaldoDevedor * (1 + (TaxaJuro / 100))) - oPeriodo.SaldoDevedor, -2);
    oPeriodoAtual.SaldoDevedor := oPeriodo.SaldoDevedor + oPeriodoAtual.ValorJuros;

    oListaPeriodos.Add(oPeriodoAtual);

    oPeriodo := oPeriodoAtual;

    ValorTotalJuros := ValorTotalJuros + oPeriodoAtual.ValorJuros;

    if (i = Periodo) then
      oPeriodoAtual.SaldoDevedor := 0;
  end;

  oPeriodo.ValorPagamento := oPeriodo.SaldoDevedor;
  oPeriodo.ValorAmortizacao := Capital;

  Result := oListaPeriodos;
end;

function TSistemaPagamentoUnicoService.CalcularTotaisFinanciamento: TPeriodo;
begin
  Result := TPeriodo.Create(0, ValorTotalJuros, Capital, Capital + ValorTotalJuros, 0);
end;

class constructor TSistemaPagamentoUnicoService.Create;
begin
  TSimuladorFinanciamentoController.Instancia.RegistrarServico(TSistemaPagamentoUnicoService);
end;

class function TSistemaPagamentoUnicoService.GetNomeServico: String;
begin
  Result := C_NOME_SERVICO;
end;

class function TSistemaPagamentoUnicoService.LazyLoadIt: TSimuladorFinanciamentoService;
begin
  Result := TSistemaPagamentoUnicoService.Create;
end;

function TSistemaPagamentoUnicoService.ValidarDadosFinanciamento(const peCapital, peTaxaJuro: Extended; const pePeriodo: SmallInt): TListaErros;
var
  oListaErros: TListaErros;
begin
  oListaErros := TListaErros.Create;

  if (peCapital <= 0) then
    oListaErros.Add('O campo "Capital" deve ter valor superior a 0.');

  if (peTaxaJuro <= 0) or (peTaxaJuro >= 100) then
    oListaErros.Add('O campo "Taxa Juros" deve ter um valor superior a 0 e inferior 100.');

  if (pePeriodo <= 0) then
    oListaErros.Add('O campo "Períodos" deve ter um valor superior a 0.');

  Result := oListaErros;
end;

end.
