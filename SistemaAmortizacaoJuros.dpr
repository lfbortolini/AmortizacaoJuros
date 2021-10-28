program SistemaAmortizacaoJuros;

uses
  Forms,
  uPrincipal in 'src\uPrincipal.pas' {mfPrincipal},
  uSimuladorFinanciamento in 'src\uSimuladorFinanciamento.pas' {SimuladorFinanciamento};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmfPrincipal, mfPrincipal);
  Application.Run;
end.
