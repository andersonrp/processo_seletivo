unit src_dm_principal;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBUpdateSQL,
  frxClass, frxDBSet;

type
  Tdm_principal = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    ibq_compositores: TIBQuery;
    ibq_compositoresCODIGO: TIntegerField;
    ibq_compositoresNOME: TIBStringField;
    ibq_compositoresANO_NASCIMENTO: TIntegerField;
    ibq_compositoresANO_FALECIMENTO: TIntegerField;
    ibu_compositores: TIBUpdateSQL;
    ibq_catalogo_tematico: TIBQuery;
    ds_compositores: TDataSource;
    ibq_composicao_musical: TIBQuery;
    ds_composicao_musical: TDataSource;
    ibq_composicao_musicalCODIGO: TIntegerField;
    ibq_composicao_musicalNOME: TIBStringField;
    ibq_composicao_musicalCOD_CATALOGO_TEMATICO: TIntegerField;
    ibq_composicao_musicalNUMERO_DA_OBRA_PRINCIPAL: TIntegerField;
    ibq_composicao_musicalNUMERO_DA_OBRA_SECUNDARIO: TIntegerField;
    ibq_composicao_musicalANO_DA_COMPOSICAO: TIntegerField;
    ibq_composicao_musicalCOD_PERIODO_MUSICAL: TIntegerField;
    ibq_composicao_musicalCOD_COMPOSITOR: TIntegerField;
    ibq_composicao_musicalCOD_ESTILO_MUSICAL: TIntegerField;
    ibq_composicao_musicalCOD_NIVEL_DIFICULDADE: TIntegerField;
    ibq_catalogo_tematicoCODIGO: TIntegerField;
    ibq_catalogo_tematicoABREVIACAO_TEMATICA: TIBStringField;
    ibq_catalogo_tematicoNOME_TEMATICO: TIBStringField;
    ibq_composicao_musicallkp_catalogo_tematico: TStringField;
    ibq_periodo_musical: TIBQuery;
    ibq_composicao_musicallkp_periodo_musical: TStringField;
    ibq_estilo_musical: TIBQuery;
    ibu_composicao_musical: TIBUpdateSQL;
    ibq_composicao_musicallkp_estilo_musical: TStringField;
    ibq_nivel_dificuldade: TIBQuery;
    ibq_nivel_dificuldadeCODIGO: TIntegerField;
    ibq_nivel_dificuldadeDESCRICAO: TIBStringField;
    ibq_periodo_musicalCODIGO: TIntegerField;
    ibq_periodo_musicalNOME: TIBStringField;
    ibq_periodo_musicalANO_INICIAL: TIntegerField;
    ibq_periodo_musicalANO_FINAL: TIntegerField;
    ibq_estilo_musicalCODIGO: TIntegerField;
    ibq_estilo_musicalNOME: TIBStringField;
    ibq_composicao_musicallkp_nivel_dificuldade: TStringField;
    ibq_composicao_musicallkp_compositor: TStringField;
    ibq_num_movimento_obra: TIBQuery;
    ibq_num_movimento_obraCODIGO: TIntegerField;
    ibq_num_movimento_obraDESCRICAO: TIBStringField;
    ibq_composicao_musicalCOD_NUM_MOV_OBRA: TIntegerField;
    ibq_composicao_musicallkp_num_mov_obra: TStringField;
    ibq_pesquisa_compositor: TIBQuery;
    ds_pesquisa_compositor: TDataSource;
    ibq_pesquisa_compositorCODIGO: TIntegerField;
    ibq_pesquisa_compositorNOME: TIBStringField;
    ibq_pesquisa_compositorANO_NASCIMENTO: TIntegerField;
    ibq_pesquisa_compositorANO_FALECIMENTO: TIntegerField;
    frxDBDcompositores: TfrxDBDataset;
    frxRcompositores: TfrxReport;
    procedure ibq_compositoresAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure atualiza_dados(DataSet: TDataSet);
  public
    { Public declarations }
    procedure habilitar_componente(valor:Boolean = true);
  end;

var
  dm_principal: Tdm_principal;

implementation

{$R *.dfm}

procedure Tdm_principal.atualiza_dados(DataSet: TDataSet);
begin
  IBTransaction1.CommitRetaining;

  with DataSet do
  begin
    Close; Open;
  end;
end;

procedure Tdm_principal.habilitar_componente(valor: Boolean);
var
  i:Integer;
begin

  IBDatabase1.Connected := valor;

  for i := ComponentCount -1 downto 0 do
  begin
    if (Components[i] is TIBquery) then
       (Components[i] as TIBquery).Active := valor;
  end;

end;

procedure Tdm_principal.ibq_compositoresAfterPost(DataSet: TDataSet);
begin
  atualiza_dados(DataSet);
end;

end.
