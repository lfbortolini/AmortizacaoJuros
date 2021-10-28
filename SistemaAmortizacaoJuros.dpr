program SistemaAmortizacaoJuros;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {mfPrincipal};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmfPrincipal, mfPrincipal);
  Application.Run;
end.
