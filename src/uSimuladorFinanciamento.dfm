object SimuladorFinanciamento: TSimuladorFinanciamento
  Left = 0
  Top = 0
  Caption = 'Simulador de financiamento'
  ClientHeight = 582
  ClientWidth = 992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 37
      Height = 13
      Caption = 'Capital:'
    end
    object Label2: TLabel
      Left = 150
      Top = 22
      Width = 72
      Height = 13
      Caption = 'Taxa de Juros:'
    end
    object Label3: TLabel
      Left = 286
      Top = 22
      Width = 45
      Height = 13
      Caption = 'Per'#237'odos:'
    end
    object meCapital: TMaskEdit
      Left = 49
      Top = 14
      Width = 88
      Height = 21
      EditMask = '###,###,##0.00'
      MaxLength = 14
      TabOrder = 0
      Text = '   ,   ,   .  '
    end
    object meTaxaJuro: TMaskEdit
      Left = 224
      Top = 14
      Width = 45
      Height = 21
      EditMask = '###,00'
      MaxLength = 6
      TabOrder = 1
      Text = '   ,  '
    end
    object mePeriodos: TMaskEdit
      Left = 337
      Top = 14
      Width = 28
      Height = 21
      EditMask = '###'
      MaxLength = 3
      TabOrder = 2
      Text = '   '
    end
    object btnSimular: TButton
      Left = 378
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Simular'
      TabOrder = 3
    end
  end
  object pCorpo: TPanel
    Left = 0
    Top = 43
    Width = 992
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object mmDetalhes: TMemo
      Left = 0
      Top = 0
      Width = 992
      Height = 539
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 204
      ExplicitTop = 224
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
end
