object mfPrincipal: TmfPrincipal
  Left = 194
  Top = 111
  Caption = 'PoC Sistema de Amortiza'#231#227'o Juros'
  ClientHeight = 557
  ClientWidth = 1065
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmPrincipal: TMainMenu
    Left = 286
    Top = 152
    object miAmortizacaoJuros: TMenuItem
      Caption = '&Amortiza'#231#227'o de juros'
    end
  end
end
