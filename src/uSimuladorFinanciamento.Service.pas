unit uSimuladorFinanciamento.Service;

interface

uses
  uSimuladorFinanciamento.Periodos;

type
  TSimuladorFinanciamentoServiceClass = class of TSimuladorFinanciamentoService;

  TSimuladorFinanciamentoService = class(TObject)
  private
    FCapital: Extended;
    FTaxaJuro: Extended;
    FTotalJuros: Extended;
    FPeriodo: SmallInt;
  public
    property Capital: Extended read FCapital write FCapital;
    property TaxaJuro: Extended read FTaxaJuro write FTaxaJuro;
    property TotalJuros: Extended read FTotalJuros write FTotalJuros;
    property Periodo: SmallInt read FPeriodo write FPeriodo;
  public
    class function GetNomeServico: String; virtual; abstract;
    class function LazyLoadIt: TSimuladorFinanciamentoService; virtual; abstract;

    function CalcularFinanciamento(const peCapital, peTaxaJuro: Extended; const pePeriodo: SmallInt): TListaPeriodos; virtual; abstract;
    function CalcularTotaisFinanciamento: TPeriodo; virtual; abstract;
  end;

implementation

end.
