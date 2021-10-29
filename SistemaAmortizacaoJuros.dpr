program SistemaAmortizacaoJuros;

uses
  Forms,
  uPrincipal in 'src\uPrincipal.pas' {mfPrincipal},
  uSimuladorFinanciamento in 'src\uSimuladorFinanciamento.pas' {SimuladorFinanciamento},
  uSimuladorFinanciamento.Controller in 'src\uSimuladorFinanciamento.Controller.pas',
  uSimuladorFinanciamento.Dados in 'src\uSimuladorFinanciamento.Dados.pas',
  uSimuladorFinanciamento.Service.API in 'src\uSimuladorFinanciamento.Service.API.pas',
  uSimuladorFinanciamento.Service in 'src\uSimuladorFinanciamento.Service.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmfPrincipal, mfPrincipal);
  Application.Run;
end.
