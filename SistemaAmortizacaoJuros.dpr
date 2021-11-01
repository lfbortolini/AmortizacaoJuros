program SistemaAmortizacaoJuros;

uses
  Forms,
  uPrincipal in 'src\uPrincipal.pas' {mfPrincipal},
  uSistemaPagamentoUnico in 'src\uSistemaPagamentoUnico.pas' {SistemaPagamentoUnico},
  uSimuladorFinanciamento.Controller in 'src\uSimuladorFinanciamento.Controller.pas',
  uSimuladorFinanciamento.Periodos in 'src\uSimuladorFinanciamento.Periodos.pas',
  uSimuladorFinanciamento.Service in 'src\uSimuladorFinanciamento.Service.pas',
  uSimuladorFinanciamento.SistemaPagamentoUnico.Service in 'src\uSimuladorFinanciamento.SistemaPagamentoUnico.Service.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmfPrincipal, mfPrincipal);
  Application.Run;
end.
