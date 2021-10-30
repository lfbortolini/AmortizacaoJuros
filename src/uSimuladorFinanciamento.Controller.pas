unit uSimuladorFinanciamento.Controller;

interface

uses
  System.Generics.Collections,
  uSimuladorFinanciamento.Service,
  Forms;

type
  TSimuladorFinanciamentoController = class
  private
    class var FoInstancia: TSimuladorFinanciamentoController;
    class constructor Create;
  protected
    FoListaFormularios: TDictionary<TSimuladorFinanciamentoServiceClass, TFormClass>;
    constructor Create; reintroduce; virtual;
  public
    class property Instancia: TSimuladorFinanciamentoController read FoInstancia;
  public
    function GetServices: TArray<TSimuladorFinanciamentoServiceClass>;
    procedure RegistrarServico(const poService: TSimuladorFinanciamentoServiceClass); virtual; final;
    procedure RegistrarFormulario(const poService: TSimuladorFinanciamentoServiceClass; const poFormulario: TFormClass); virtual; final;
  end;

implementation

{ TSimuladorFinanciamentoController }

class constructor TSimuladorFinanciamentoController.Create;
begin
  FoInstancia := TSimuladorFinanciamentoController.Create;
end;

constructor TSimuladorFinanciamentoController.Create;
begin
  inherited Create;
  FoListaFormularios := TDictionary<TSimuladorFinanciamentoServiceClass, TFormClass>.Create;
end;

function TSimuladorFinanciamentoController.GetServices: TArray<TSimuladorFinanciamentoServiceClass>;
begin
  Result := FoListaFormularios.Keys.ToArray;
end;

procedure TSimuladorFinanciamentoController.RegistrarFormulario(const poService: TSimuladorFinanciamentoServiceClass; const poFormulario: TFormClass);
begin
  FoListaFormularios.AddOrSetValue(poService, poFormulario);
end;

procedure TSimuladorFinanciamentoController.RegistrarServico(const poService: TSimuladorFinanciamentoServiceClass);
begin
  FoListaFormularios.Add(poService, nil);
end;

end.
