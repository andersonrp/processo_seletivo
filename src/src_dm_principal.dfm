object dm_principal: Tdm_principal
  OldCreateOrder = False
  Left = 348
  Top = 174
  Height = 396
  Width = 864
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\processo_seletivo\db\REPERTORIO_PIANISTICO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 40
    Top = 72
  end
  object ibq_compositores: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterPost = ibq_compositoresAfterPost
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_compositor tc order by tc.ano_nascimento')
    UpdateObject = ibu_compositores
    Left = 344
    Top = 16
    object ibq_compositoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_COMPOSITOR.CODIGO'
    end
    object ibq_compositoresNOME: TIBStringField
      DisplayLabel = 'Nome do compositor'
      FieldName = 'NOME'
      Origin = 'TAB_COMPOSITOR.NOME'
      Required = True
      Size = 60
    end
    object ibq_compositoresANO_NASCIMENTO: TIntegerField
      DisplayLabel = 'Ano de nascimento '
      FieldName = 'ANO_NASCIMENTO'
      Origin = 'TAB_COMPOSITOR.ANO_NASCIMENTO'
      Required = True
    end
    object ibq_compositoresANO_FALECIMENTO: TIntegerField
      DisplayLabel = 'Ano de falecimento '
      FieldName = 'ANO_FALECIMENTO'
      Origin = 'TAB_COMPOSITOR.ANO_FALECIMENTO'
    end
  end
  object ibu_compositores: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOME,'
      '  ANO_NASCIMENTO,'
      '  ANO_FALECIMENTO'
      'from TAB_COMPOSITOR '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TAB_COMPOSITOR'
      'set'
      '  NOME = :NOME,'
      '  ANO_NASCIMENTO = :ANO_NASCIMENTO,'
      '  ANO_FALECIMENTO = :ANO_FALECIMENTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TAB_COMPOSITOR'
      '  (NOME, ANO_NASCIMENTO, ANO_FALECIMENTO)'
      'values'
      '  (:NOME, :ANO_NASCIMENTO, :ANO_FALECIMENTO)')
    DeleteSQL.Strings = (
      'delete from TAB_COMPOSITOR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 344
    Top = 128
  end
  object ibq_catalogo_tematico: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_CATALOGO_TEMATICO')
    Left = 144
    Top = 16
    object ibq_catalogo_tematicoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_CATALOGO_TEMATICO.CODIGO'
      Required = True
    end
    object ibq_catalogo_tematicoABREVIACAO_TEMATICA: TIBStringField
      FieldName = 'ABREVIACAO_TEMATICA'
      Origin = 'TAB_CATALOGO_TEMATICO.ABREVIACAO_TEMATICA'
      Size = 30
    end
    object ibq_catalogo_tematicoNOME_TEMATICO: TIBStringField
      FieldName = 'NOME_TEMATICO'
      Origin = 'TAB_CATALOGO_TEMATICO.NOME_TEMATICO'
      Size = 60
    end
  end
  object ds_compositores: TDataSource
    DataSet = ibq_compositores
    Left = 344
    Top = 72
  end
  object ibq_composicao_musical: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_composicao_musical tcm'
      'where tcm.cod_compositor > 0 and tcm.cod_estilo_musical=1')
    UpdateObject = ibu_composicao_musical
    Left = 480
    Top = 16
    object ibq_composicao_musicalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_COMPOSICAO_MUSICAL.CODIGO'
    end
    object ibq_composicao_musicalNOME: TIBStringField
      DisplayLabel = 'Nome da pe'#231'a'
      FieldName = 'NOME'
      Origin = 'TAB_COMPOSICAO_MUSICAL.NOME'
      Required = True
      Size = 60
    end
    object ibq_composicao_musicalCOD_CATALOGO_TEMATICO: TIntegerField
      FieldName = 'COD_CATALOGO_TEMATICO'
      Origin = 'TAB_COMPOSICAO_MUSICAL.COD_CATALOGO_TEMATICO'
    end
    object ibq_composicao_musicalNUMERO_DA_OBRA_PRINCIPAL: TIntegerField
      DisplayLabel = 'N'#186' da Obra'
      FieldName = 'NUMERO_DA_OBRA_PRINCIPAL'
      Origin = 'TAB_COMPOSICAO_MUSICAL.NUMERO_DA_OBRA_PRINCIPAL'
    end
    object ibq_composicao_musicalNUMERO_DA_OBRA_SECUNDARIO: TIntegerField
      DisplayLabel = 'N'#186' Secund'#225'rio da Obra'
      FieldName = 'NUMERO_DA_OBRA_SECUNDARIO'
      Origin = 'TAB_COMPOSICAO_MUSICAL.NUMERO_DA_OBRA_SECUNDARIO'
    end
    object ibq_composicao_musicalCOD_NUM_MOV_OBRA: TIntegerField
      FieldName = 'COD_NUM_MOV_OBRA'
      Origin = 'TAB_COMPOSICAO_MUSICAL.COD_NUM_MOV_OBRA'
      Required = True
    end
    object ibq_composicao_musicalANO_DA_COMPOSICAO: TIntegerField
      DisplayLabel = 'Ano da composi'#231#227'o'
      FieldName = 'ANO_DA_COMPOSICAO'
      Origin = 'TAB_COMPOSICAO_MUSICAL.ANO_DA_COMPOSICAO'
    end
    object ibq_composicao_musicalCOD_PERIODO_MUSICAL: TIntegerField
      FieldName = 'COD_PERIODO_MUSICAL'
      Origin = 'TAB_COMPOSICAO_MUSICAL.COD_PERIODO_MUSICAL'
    end
    object ibq_composicao_musicalCOD_COMPOSITOR: TIntegerField
      FieldName = 'COD_COMPOSITOR'
      Origin = 'TAB_COMPOSICAO_MUSICAL.COD_COMPOSITOR'
    end
    object ibq_composicao_musicalCOD_ESTILO_MUSICAL: TIntegerField
      FieldName = 'COD_ESTILO_MUSICAL'
      Origin = 'TAB_COMPOSICAO_MUSICAL.COD_ESTILO_MUSICAL'
    end
    object ibq_composicao_musicalCOD_NIVEL_DIFICULDADE: TIntegerField
      FieldName = 'COD_NIVEL_DIFICULDADE'
      Origin = 'TAB_COMPOSICAO_MUSICAL.COD_NIVEL_DIFICULDADE'
    end
    object ibq_composicao_musicallkp_catalogo_tematico: TStringField
      DisplayLabel = 'Cat'#225'logo tem'#225'tico'
      FieldKind = fkLookup
      FieldName = 'lkp_catalogo_tematico'
      LookupDataSet = ibq_catalogo_tematico
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ABREVIACAO_TEMATICA'
      KeyFields = 'COD_CATALOGO_TEMATICO'
      Size = 30
      Lookup = True
    end
    object ibq_composicao_musicallkp_periodo_musical: TStringField
      DisplayLabel = 'Per'#237'odo musical'
      FieldKind = fkLookup
      FieldName = 'lkp_periodo_musical'
      LookupDataSet = ibq_periodo_musical
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'COD_PERIODO_MUSICAL'
      Size = 30
      Lookup = True
    end
    object ibq_composicao_musicallkp_estilo_musical: TStringField
      DisplayLabel = 'Estilo musical'
      FieldKind = fkLookup
      FieldName = 'lkp_estilo_musical'
      LookupDataSet = ibq_estilo_musical
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'COD_ESTILO_MUSICAL'
      Size = 30
      Lookup = True
    end
    object ibq_composicao_musicallkp_nivel_dificuldade: TStringField
      DisplayLabel = 'N'#237'vel de dificuldade'
      FieldKind = fkLookup
      FieldName = 'lkp_nivel_dificuldade'
      LookupDataSet = ibq_nivel_dificuldade
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_NIVEL_DIFICULDADE'
      Size = 30
      Lookup = True
    end
    object ibq_composicao_musicallkp_compositor: TStringField
      DisplayLabel = 'Compositor'
      FieldKind = fkLookup
      FieldName = 'lkp_compositor'
      LookupDataSet = ibq_compositores
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'COD_COMPOSITOR'
      Size = 60
      Lookup = True
    end
    object ibq_composicao_musicallkp_num_mov_obra: TStringField
      DisplayLabel = 'Movimento'
      FieldKind = fkLookup
      FieldName = 'lkp_num_mov_obra'
      LookupDataSet = ibq_num_movimento_obra
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_NUM_MOV_OBRA'
      Size = 30
      Lookup = True
    end
  end
  object ds_composicao_musical: TDataSource
    DataSet = ibq_composicao_musical
    Left = 480
    Top = 72
  end
  object ibq_periodo_musical: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_PERIODO_MUSICAL')
    Left = 144
    Top = 128
    object ibq_periodo_musicalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_PERIODO_MUSICAL.CODIGO'
      Required = True
    end
    object ibq_periodo_musicalNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TAB_PERIODO_MUSICAL.NOME'
      Required = True
      Size = 60
    end
    object ibq_periodo_musicalANO_INICIAL: TIntegerField
      FieldName = 'ANO_INICIAL'
      Origin = 'TAB_PERIODO_MUSICAL.ANO_INICIAL'
      Required = True
    end
    object ibq_periodo_musicalANO_FINAL: TIntegerField
      FieldName = 'ANO_FINAL'
      Origin = 'TAB_PERIODO_MUSICAL.ANO_FINAL'
    end
  end
  object ibq_estilo_musical: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_ESTILO_MUSICAL')
    Left = 144
    Top = 72
    object ibq_estilo_musicalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_ESTILO_MUSICAL.CODIGO'
      Required = True
    end
    object ibq_estilo_musicalNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TAB_ESTILO_MUSICAL.NOME'
      Required = True
      Size = 30
    end
  end
  object ibu_composicao_musical: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOME,'
      '  COD_CATALOGO_TEMATICO,'
      '  NUMERO_DA_OBRA_PRINCIPAL,'
      '  NUMERO_DA_OBRA_SECUNDARIO,'
      '  ANO_DA_COMPOSICAO,'
      '  COD_PERIODO_MUSICAL,'
      '  COD_COMPOSITOR,'
      '  COD_ESTILO_MUSICAL,'
      '  COD_NIVEL_DIFICULDADE'
      'from TAB_COMPOSICAO_MUSICAL '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TAB_COMPOSICAO_MUSICAL'
      'set'
      '  NOME = :NOME,'
      '  COD_CATALOGO_TEMATICO = :COD_CATALOGO_TEMATICO,'
      '  NUMERO_DA_OBRA_PRINCIPAL = :NUMERO_DA_OBRA_PRINCIPAL,'
      '  NUMERO_DA_OBRA_SECUNDARIO = :NUMERO_DA_OBRA_SECUNDARIO,'
      '  ANO_DA_COMPOSICAO = :ANO_DA_COMPOSICAO,'
      '  COD_PERIODO_MUSICAL = :COD_PERIODO_MUSICAL,'
      '  COD_COMPOSITOR = :COD_COMPOSITOR,'
      '  COD_ESTILO_MUSICAL = :COD_ESTILO_MUSICAL,'
      '  COD_NIVEL_DIFICULDADE = :COD_NIVEL_DIFICULDADE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TAB_COMPOSICAO_MUSICAL'
      
        '  (NOME, COD_CATALOGO_TEMATICO, NUMERO_DA_OBRA_PRINCIPAL, NUMERO' +
        '_DA_OBRA_SECUNDARIO, '
      
        '   ANO_DA_COMPOSICAO, COD_PERIODO_MUSICAL, COD_COMPOSITOR, COD_E' +
        'STILO_MUSICAL, '
      '   COD_NIVEL_DIFICULDADE)'
      'values'
      
        '  (:NOME, :COD_CATALOGO_TEMATICO, :NUMERO_DA_OBRA_PRINCIPAL, :NU' +
        'MERO_DA_OBRA_SECUNDARIO, '
      
        '   :ANO_DA_COMPOSICAO, :COD_PERIODO_MUSICAL, :COD_COMPOSITOR, :C' +
        'OD_ESTILO_MUSICAL, '
      '   :COD_NIVEL_DIFICULDADE)')
    DeleteSQL.Strings = (
      'delete from TAB_COMPOSICAO_MUSICAL'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 480
    Top = 128
  end
  object ibq_nivel_dificuldade: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_NIVEL_DIFICULDADE')
    Left = 144
    Top = 184
    object ibq_nivel_dificuldadeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_NIVEL_DIFICULDADE.CODIGO'
      Required = True
    end
    object ibq_nivel_dificuldadeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TAB_NIVEL_DIFICULDADE.DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object ibq_num_movimento_obra: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_NUMERO_MOVIMENTO_OBRA')
    Left = 144
    Top = 240
    object ibq_num_movimento_obraCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_NUMERO_MOVIMENTO_OBRA.CODIGO'
      Required = True
    end
    object ibq_num_movimento_obraDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TAB_NUMERO_MOVIMENTO_OBRA.DESCRICAO'
      Size = 30
    end
  end
  object ibq_pesquisa_compositor: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_compositor tc'
      'where tc.nome starting :nome or tc.nome containing :nome'
      'order by tc.nome')
    Left = 632
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end>
    object ibq_pesquisa_compositorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TAB_COMPOSITOR.CODIGO'
      Required = True
    end
    object ibq_pesquisa_compositorNOME: TIBStringField
      DisplayLabel = 'Nome do compositor'
      FieldName = 'NOME'
      Origin = 'TAB_COMPOSITOR.NOME'
      Required = True
      Size = 60
    end
    object ibq_pesquisa_compositorANO_NASCIMENTO: TIntegerField
      DisplayLabel = 'Ano de nascimento '
      FieldName = 'ANO_NASCIMENTO'
      Origin = 'TAB_COMPOSITOR.ANO_NASCIMENTO'
      Required = True
    end
    object ibq_pesquisa_compositorANO_FALECIMENTO: TIntegerField
      DisplayLabel = 'Ano de falecimento '
      FieldName = 'ANO_FALECIMENTO'
      Origin = 'TAB_COMPOSITOR.ANO_FALECIMENTO'
    end
  end
  object ds_pesquisa_compositor: TDataSource
    DataSet = ibq_pesquisa_compositor
    Left = 640
    Top = 72
  end
  object frxDBDcompositores: TfrxDBDataset
    UserName = 'frxDBDcompositores'
    CloseDataSource = False
    FieldAliases.Strings = (
      '-CODIGO=CODIGO'
      'NOME=NOME'
      'ANO_NASCIMENTO=ANO_NASCIMENTO'
      'ANO_FALECIMENTO=ANO_FALECIMENTO')
    DataSet = ibq_compositores
    BCDToCurrency = False
    Left = 604
    Top = 216
  end
  object frxRcompositores: TfrxReport
    Version = '6.4.17'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43776.468734953700000000
    ReportOptions.LastChange = 43776.505007384300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 700
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDcompositores
        DataSetName = 'frxDBDcompositores'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 4.015770000000000000
          Width = 389.291590000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            'Compositores Musicais')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 413.527830000000000000
          Top = 2.559060000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8 = (
            'CONTROLE DE REPERT'#195#8220'RIO PIANISTICO')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 38.692950000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8 = (
            '[DATE]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 61.031540000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            'Compositor')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 418.448980000000000000
          Top = 64.252010000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            'Ano de nascimento')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 64.252010000000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            'Ano de falecimento')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Top = 86.370130000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.300000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDcompositores
        DataSetName = 'frxDBDcompositores'
        RowCount = 0
        object frxDBDataset1nome: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBDcompositores
          DataSetName = 'frxDBDcompositores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            '[frxDBDcompositores."nome"]')
          ParentFont = False
        end
        object frxDBDataset1banco: TfrxMemoView
          AllowVectorExport = True
          Left = 418.393700787402000000
          Width = 117.165354330709000000
          Height = 18.897650000000000000
          DataField = 'ANO_NASCIMENTO'
          DataSet = frxDBDcompositores
          DataSetName = 'frxDBDcompositores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDcompositores."ANO_NASCIMENTO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          DataSet = frxDBDcompositores
          DataSetName = 'frxDBDcompositores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frxDBDcompositores."ANO_FALECIMENTO"> = 0,NULL,<frxDBDcomp' +
              'ositores."ANO_FALECIMENTO">)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 597.165740000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 540.693260000000000000
          Top = 2.779530000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#] ')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 321.260050000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 5.118120000000000000
          Top = 10.897650000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8 = (
            'Total de registros: [COUNT(MasterData1,2)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -0.118120000000000000
          Top = 2.354360000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
end
