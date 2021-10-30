unit uSimuladorFinanciamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TSimuladorFinanciamento = class(TForm)
    pCabecalho: TPanel;
    pCorpo: TPanel;
    meCapital: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    meTaxaJuro: TMaskEdit;
    Label3: TLabel;
    mePeriodos: TMaskEdit;
    btnSimular: TButton;
    mmDetalhes: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SimuladorFinanciamento: TSimuladorFinanciamento;

implementation

{$R *.dfm}

end.
