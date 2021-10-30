unit uSimuladorFinanciamento.Service;

interface

type
  TSimuladorFinanciamentoServiceClass = class of TSimuladorFinanciamentoService;

  TSimuladorFinanciamentoService = class(TObject)
  public
    class function GetNomeServico: String; virtual; abstract;
  end;

implementation

end.
