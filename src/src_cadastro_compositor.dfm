object frm_cadastro_compositor: Tfrm_cadastro_compositor
  Left = 397
  Top = 232
  BorderStyle = bsDialog
  Caption = 'Cadastro de Compositor'
  ClientHeight = 206
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_nome_compositor: TLabel
    Left = 24
    Top = 24
    Width = 104
    Height = 13
    Hint = '* Campo obrigat'#243'rio'
    Caption = 'Nome do compositor *'
    ParentShowHint = False
    ShowHint = True
  end
  object lbl_ano_nasc_compositor: TLabel
    Left = 26
    Top = 79
    Width = 98
    Height = 13
    Hint = '* Campo obrigat'#243'rio'
    Caption = 'Ano de nascimento *'
    ParentShowHint = False
    ShowHint = True
  end
  object lbl_ano_falec_compositor: TLabel
    Left = 146
    Top = 79
    Width = 91
    Height = 13
    Caption = 'Ano de falecimento'
  end
  object edt_nome_compositor: TEdit
    Left = 24
    Top = 40
    Width = 321
    Height = 21
    MaxLength = 250
    TabOrder = 0
    OnKeyDown = edt_nome_compositorKeyDown
    OnKeyUp = edt_nome_compositorKeyUp
  end
  object edt_ano_nasc_compositor: TEdit
    Left = 24
    Top = 95
    Width = 97
    Height = 21
    MaxLength = 4
    TabOrder = 1
    OnKeyDown = edt_ano_nasc_compositorKeyDown
    OnKeyUp = edt_ano_nasc_compositorKeyUp
  end
  object edt_ano_falec_compositor: TEdit
    Left = 144
    Top = 95
    Width = 97
    Height = 21
    MaxLength = 4
    TabOrder = 2
    OnKeyDown = edt_ano_falec_compositorKeyDown
    OnKeyUp = edt_ano_falec_compositorKeyUp
  end
  object btn_salvar_compositor: TButton
    Left = 176
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 3
    OnClick = btn_salvar_compositorClick
  end
  object btn_cancelar: TButton
    Left = 264
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btn_cancelarClick
  end
end
