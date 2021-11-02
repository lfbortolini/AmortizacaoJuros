unit uSimuladorFinanciamento.Periodos;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TPeriodo = class
  protected
    FPeriodo: SmallInt;
    FValorJuros: Extended;
    FValorAmortizacao: Extended;
    FValorPagamento: Extended;
    FSaldoDevedor: Extended;
  public
    property Periodo: SmallInt read FPeriodo write FPeriodo;
    property ValorJuros: Extended read FValorJuros write FValorJuros;
    property ValorAmortizacao: Extended read FValorAmortizacao write FValorAmortizacao;
    property ValorPagamento: Extended read FValorPagamento write FValorPagamento;
    property SaldoDevedor: Extended read FSaldoDevedor write FSaldoDevedor;
  public
    constructor Create(const psPeriodo: SmallInt; const peValorJuros, peValorAmortizacao, peValorPagamento, peSaldoDevedor: Extended); reintroduce; overload; virtual;
    constructor Create; reintroduce; overload; virtual;
  end;

  TListaPeriodos = class(TList<TPeriodo>)
  public
    destructor Destroy; override;
  end;

  TPeriodoHelper = class helper for TPeriodo
  public
    function PeriodoToString: string;
    function ValorJurosToString: string;
    function ValorAmortizacaoToString: string;
    function ValorPagamentoToString: string;
    function SaldoDevedorToString: string;
  end;

implementation

{ TPeriodo }

constructor TPeriodo.Create;
begin
  Create(0, 0, 0, 0, 0);
end;

constructor TPeriodo.Create(const psPeriodo: SmallInt; const peValorJuros, peValorAmortizacao, peValorPagamento, peSaldoDevedor: Extended);
begin
  inherited Create;
  FPeriodo := psPeriodo;
  FValorJuros := peValorJuros;
  FValorAmortizacao := peValorAmortizacao;
  FValorPagamento := peValorPagamento;
  FSaldoDevedor := peSaldoDevedor;
end;

{ TListaPeriodos }

destructor TListaPeriodos.Destroy;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Items[I].Free;
  end;
  inherited;
end;

{ TPeriodoHelper }

function TPeriodoHelper.ValorAmortizacaoToString: string;
begin
  Result := FormatCurr(',0.00', Self.ValorAmortizacao);
end;

function TPeriodoHelper.ValorJurosToString: string;
begin
  Result := FormatCurr(',0.00', Self.ValorJuros);
end;

function TPeriodoHelper.ValorPagamentoToString: string;
begin
  Result := FormatCurr(',0.00', Self.ValorPagamento);
end;

function TPeriodoHelper.PeriodoToString: string;
begin
  Result := IntToStr(Self.Periodo);
end;

function TPeriodoHelper.SaldoDevedorToString: string;
begin
  Result := FormatCurr(',0.00', Self.SaldoDevedor);
end;

end.
