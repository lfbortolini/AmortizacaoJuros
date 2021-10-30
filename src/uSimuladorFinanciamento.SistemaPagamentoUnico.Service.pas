unit uSimuladorFinanciamento.SistemaPagamentoUnico.Service;

interface

uses
  uSimuladorFinanciamento.Service,
  uSimuladorFinanciamento.Service.API;

type
  TSistemaPagamentoUnicoService = class(TSimuladorFinanciamentoService, ISimuladorFinanciamentoServiceAPI)
  private
    [Volatile] FRefCount: Integer;

    const C_NOME_SERVICO = 'Sistema de Pagamento único';
  protected
    class constructor Create;
  public
    class function GetNomeServico: String; override;

    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

implementation

uses
  uSimuladorFinanciamento.Controller;

{ TSistemaPagamentoUnicoService }

class constructor TSistemaPagamentoUnicoService.Create;
begin
  TSimuladorFinanciamentoController.Instancia.RegistrarServico(TSistemaPagamentoUnicoService);
end;

class function TSistemaPagamentoUnicoService.GetNomeServico: String;
begin
  Result := C_NOME_SERVICO;
end;

function TSistemaPagamentoUnicoService.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TSistemaPagamentoUnicoService._AddRef: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;

function TSistemaPagamentoUnicoService._Release: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicDecrement(FRefCount);
  if Result = 0 then
    Destroy;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

end.
