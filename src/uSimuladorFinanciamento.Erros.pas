unit uSimuladorFinanciamento.Erros;

interface

uses
  System.Generics.Collections;

type

  TListaErros = class(TList<string>)
  end;

  TListaErrosHelper = class helper for TListaErros
  public
    function ToMessage: string;
  end;

implementation

{ TListaErrosHelper }

function TListaErrosHelper.ToMessage: string;
const
  QUEBRA_LINHA = #13#10;
var
  sErro, sResult: string;
begin
  sResult := '';
  for sErro in Self do
    sResult := sResult + sErro + QUEBRA_LINHA;

  Result := sResult;
end;

end.
