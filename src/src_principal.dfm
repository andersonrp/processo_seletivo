object frm_principal: Tfrm_principal
  Left = 287
  Top = 143
  Width = 820
  Height = 450
  BorderIcons = [biSystemMenu]
  Caption = 'Repert'#243'rio pian'#237'stico'
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 820
  Constraints.MinHeight = 450
  Constraints.MinWidth = 820
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc_principal: TPageControl
    Left = 8
    Top = 16
    Width = 785
    Height = 369
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Compositores'
      object dbg_compositores: TDBGrid
        Left = 16
        Top = 8
        Width = 737
        Height = 281
        DataSource = dm_principal.ds_compositores
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbg_compositoresCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 200
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
      object btn_cadastrar: TButton
        Left = 355
        Top = 296
        Width = 74
        Height = 25
        Caption = '&Cadastrar'
        TabOrder = 1
        OnClick = btn_cadastrarClick
      end
      object btn_editar_compositor: TButton
        Left = 435
        Top = 296
        Width = 74
        Height = 25
        Caption = '&Editar'
        Enabled = False
        TabOrder = 2
        OnClick = btn_editar_compositorClick
      end
      object btn_excluir_compositor: TButton
        Left = 515
        Top = 296
        Width = 74
        Height = 25
        Caption = '&Excluir'
        Enabled = False
        TabOrder = 3
        OnClick = btn_excluir_compositorClick
      end
      object btn_pesquisar: TButton
        Left = 599
        Top = 296
        Width = 74
        Height = 25
        Caption = '&Pesquisar'
        TabOrder = 4
        OnClick = btn_pesquisarClick
      end
      object btn_relatorio: TButton
        Left = 680
        Top = 296
        Width = 75
        Height = 25
        Caption = '&Relat'#243'rio'
        TabOrder = 5
        OnClick = btn_relatorioClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Composi'#231#227'o musical'
      ImageIndex = 1
      object dbg_composicao_musical: TDBGrid
        Left = 8
        Top = 8
        Width = 745
        Height = 177
        DataSource = dm_principal.ds_composicao_musical
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 203
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkp_estilo_musical'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkp_periodo_musical'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkp_compositor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkp_catalogo_tematico'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_DA_OBRA_PRINCIPAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_DA_OBRA_SECUNDARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANO_DA_COMPOSICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkp_nivel_dificuldade'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkp_num_mov_obra'
            Width = 64
            Visible = True
          end>
      end
    end
  end
end
