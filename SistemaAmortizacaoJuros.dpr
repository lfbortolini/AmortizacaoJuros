program SistemaAmortizacaoJuros;

uses
  Forms,
  uPrincipal in 'src\uPrincipal.pas' {mfPrincipal},
  uSistemaPagamentoUnico in 'src\uSistemaPagamentoUnico.pas' {SistemaPagamentoUnico},
  uSimuladorFinanciamento.Controller in 'src\uSimuladorFinanciamento.Controller.pas',
  uSimuladorFinanciamento.Dados in 'src\uSimuladorFinanciamento.Dados.pas',
  uSimuladorFinanciamento.Service.API in 'src\uSimuladorFinanciamento.Service.API.pas',
  uSimuladorFinanciamento.Service in 'src\uSimuladorFinanciamento.Service.pas',
  uSimuladorFinanciamento.SistemaPagamentoUnico.Service in 'src\uSimuladorFinanciamento.SistemaPagamentoUnico.Service.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmfPrincipal, mfPrincipal);
  Application.Run;
end.
