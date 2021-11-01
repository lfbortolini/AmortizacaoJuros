unit uSimuladorFinanciamento.SistemaPagamentoUnico.Service;

interface

uses
  uSimuladorFinanciamento.Service,
  uSimuladorFinanciamento.Periodos;

type
  TSistemaPagamentoUnicoService = class(TSimuladorFinanciamentoService)
  private
    const C_NOME_SERVICO = 'Sistema de Pagamento �nico';
  protected
    class constructor Create;
  public
    class function GetNomeServico: String; override;
    class function LazyLoadIt: TSimuladorFinanciamentoService; override;

    function CalcularFinanciamento(const peCapital, peTaxaJuro: Extended; const pePeriodo: SmallInt): TListaPeriodos; override;
    function CalcularTotaisFinanciamento: TPeriodo; override;
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
  TotalJuros := 0;
  Periodo := pePeriodo;

  oListaPeriodos := TListaPeriodos.Create;

  // Adiciona a primeiro periodo onde temos somente o saldo devedor
  oPeriodo := TPeriodo.Create;
  oPeriodo.SaldoDevedor := Capital;
  oListaPeriodos.Add(oPeriodo);

  for I := 1 to Periodo do
  begin
    oPeriodoAtual := TPeriodo.Create;
    oPeriodoAtual.Periodo := I;
    oPeriodoAtual.Amortizacao := 0;
    oPeriodoAtual.Pagamento := 0;
    oPeriodoAtual.Juros := RoundTo((oPeriodo.SaldoDevedor * (1 + (TaxaJuro / 100))) - oPeriodo.SaldoDevedor, -2);
    oPeriodoAtual.SaldoDevedor := oPeriodo.SaldoDevedor + oPeriodoAtual.Juros;

    oListaPeriodos.Add(oPeriodoAtual);

    oPeriodo := oPeriodoAtual;

    TotalJuros := TotalJuros + oPeriodoAtual.Juros;

    if (i = Periodo) then
      oPeriodoAtual.SaldoDevedor := 0;
  end;

  oPeriodo.Pagamento := oPeriodo.SaldoDevedor;
  oPeriodo.Amortizacao := Capital;

  Result := oListaPeriodos;
end;

function TSistemaPagamentoUnicoService.CalcularTotaisFinanciamento: TPeriodo;
begin
  Result := TPeriodo.Create(0, TotalJuros, Capital, Capital + TotalJuros, 0);
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

end.
