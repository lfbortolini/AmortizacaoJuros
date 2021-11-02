object SistemaPagamentoUnico: TSistemaPagamentoUnico
  Left = 0
  Top = 0
  Caption = 'Sistema de Pagamento '#250'nico'
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnSimular: TButton
      Left = 268
      Top = 20
      Width = 79
      Height = 25
      Caption = 'Simular'
      TabOrder = 3
      OnClick = btnSimularClick
    end
    object leCapital: TLabeledEdit
      Left = 12
      Top = 24
      Width = 121
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Capital'
      TabOrder = 0
    end
    object leTaxaJuro: TLabeledEdit
      Left = 146
      Top = 24
      Width = 53
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = 'Taxa Juros'
      TabOrder = 1
    end
    object lePeriodo: TLabeledEdit
      Left = 214
      Top = 24
      Width = 41
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Periodos'
      TabOrder = 2
    end
  end
  object pCorpo: TPanel
    Left = 0
    Top = 54
    Width = 992
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lvDetalhes: TListView
      Left = 0
      Top = 0
      Width = 992
      Height = 528
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = 'Per'#237'odo'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Juros'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Amortiza'#231#227'o Saldo devedor'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Pagamento'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Saldo devedor'
        end>
      ColumnClick = False
      Groups = <
        item
          Header = 'Defini'#231#245'es'
          GroupID = 0
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          TitleImage = -1
        end
        item
          Header = 'Per'#237'odos'
          GroupID = 1
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          TitleImage = -1
        end
        item
          Header = 'Totalizador'
          GroupID = 2
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          TitleImage = -1
        end>
      HotTrack = True
      HotTrackStyles = [htHandPoint]
      Items.ItemData = {
        052C0000000100000000000000FFFFFFFFFFFFFFFF0200000000000000000000
        00013000013000C0CE144F00B09A144FFFFFFFFF}
      GroupView = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitLeft = 240
      ExplicitTop = 176
      ExplicitWidth = 250
      ExplicitHeight = 150
    end
  end
end
