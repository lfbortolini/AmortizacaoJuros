unit uSimuladorFinanciamento.Periodos;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TPeriodo = class
  protected
    FPeriodo: SmallInt;
    FJuros: Extended;
    FAmortizacao: Extended;
    FPagamento: Extended;
    FSaldoDevedor: Extended;
  public
    property Periodo: SmallInt read FPeriodo write FPeriodo;
    property Juros: Extended read FJuros write FJuros;
    property Amortizacao: Extended read FAmortizacao write FAmortizacao;
    property Pagamento: Extended read FPagamento write FPagamento;
    property SaldoDevedor: Extended read FSaldoDevedor write FSaldoDevedor;
  public
    constructor Create(const psPeriodo: SmallInt; const peJuros, peAmortizacao, pePagamento, peSaldoDevedor: Extended); reintroduce; overload; virtual;
    constructor Create; reintroduce; overload; virtual;
  end;

  TListaPeriodos = class(TList<TPeriodo>)
  public
    destructor Destroy; override;
  end;

  TPeriodoHelper = class helper for TPeriodo
  public
    function PeriodoToString: string;
    function JurosToString: string;
    function AmortizacaoToString: string;
    function PagamentoToString: string;
    function SaldoDevedorToString: string;
  end;

implementation

{ TPeriodo }

constructor TPeriodo.Create;
begin
  Create(0, 0, 0, 0, 0);
end;

constructor TPeriodo.Create(const psPeriodo: SmallInt; const peJuros, peAmortizacao, pePagamento, peSaldoDevedor: Extended);
begin
  inherited Create;
  FPeriodo := psPeriodo;
  FJuros := peJuros;
  FAmortizacao := peAmortizacao;
  FPagamento := pePagamento;
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

function TPeriodoHelper.AmortizacaoToString: string;
begin
  Result := FormatCurr(',0.00', Self.Amortizacao);
end;

function TPeriodoHelper.JurosToString: string;
begin
  Result := FormatCurr(',0.00', Self.Juros);
end;

function TPeriodoHelper.PagamentoToString: string;
begin
  Result := FormatCurr(',0.00', Self.Pagamento);
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
