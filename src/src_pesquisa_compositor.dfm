object frm_pesquisa_compositor: Tfrm_pesquisa_compositor
  Left = 489
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Pesquisa de Compositor'
  ClientHeight = 291
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 98
    Height = 13
    Caption = 'Nome do Compositor'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object edt_pesquisa_nome_compositor: TEdit
    Left = 24
    Top = 40
    Width = 393
    Height = 21
    TabOrder = 0
    OnKeyDown = edt_pesquisa_nome_compositorKeyDown
  end
  object btn_ok_pesquisa_compositor: TButton
    Left = 256
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 1
    OnClick = btn_ok_pesquisa_compositorClick
  end
  object btn_cancelar_pesquisa_compositor: TButton
    Left = 344
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btn_cancelar_pesquisa_compositorClick
  end
  object dbg_pesquisa_compositor: TDBGrid
    Left = 24
    Top = 96
    Width = 393
    Height = 120
    Hint = 'D'#234' um duplo click na linha para selecionar o registro.'
    DataSource = dm_principal.ds_pesquisa_compositor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbg_pesquisa_compositorDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO_NASCIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO_FALECIMENTO'
        Visible = True
      end>
  end
end
