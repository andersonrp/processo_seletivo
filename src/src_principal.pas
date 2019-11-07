unit src_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls, StdCtrls,
  frxClass, frxDBSet;

type
  Tfrm_principal = class(TForm)
    pgc_principal: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbg_compositores: TDBGrid;
    dbg_composicao_musical: TDBGrid;
    btn_cadastrar: TButton;
    btn_editar_compositor: TButton;
    btn_excluir_compositor: TButton;
    btn_pesquisar: TButton;
    btn_relatorio: TButton;
    procedure btn_cadastrarClick(Sender: TObject);
    procedure dbg_compositoresCellClick(Column: TColumn);
    procedure btn_editar_compositorClick(Sender: TObject);
    procedure btn_excluir_compositorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_relatorioClick(Sender: TObject);
  private
    { Private declarations }
    procedure cadastrar_compositor;
    procedure editar_compositor;
    procedure habilitar_botoes(valor:Boolean = true);
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

uses src_dm_principal, src_cadastro_compositor, DateUtils, src_funcoes, IBQuery,
  src_pesquisa_compositor;

{$R *.dfm}

procedure Tfrm_principal.btn_cadastrarClick(Sender: TObject);
begin
  cadastrar_compositor;
end;

procedure Tfrm_principal.dbg_compositoresCellClick(Column: TColumn);
begin
  habilitar_botoes;
end;

procedure Tfrm_principal.btn_editar_compositorClick(Sender: TObject);
begin
  editar_compositor;
end;

procedure Tfrm_principal.editar_compositor;
var
  nome:string;
  ano_nascimento, ano_falecimento:Integer;
begin

  with dm_principal.ibq_compositores do
  begin
    nome := FieldByName('nome').AsString;
    ano_nascimento := FieldByName('ano_nascimento').AsInteger;
    ano_falecimento := FieldByName('ano_falecimento').AsInteger;
  end;

  with frm_cadastro_compositor do
  begin
    acao_editar := true;
    edt_nome_compositor.Text := nome;
    edt_ano_nasc_compositor.Text := IntToStr(ano_nascimento);
    edt_ano_falec_compositor.Text := IntToStr(ano_falecimento);
    ShowModal;
  end;

  habilitar_botoes(false);

end;

procedure Tfrm_principal.habilitar_botoes(valor:Boolean = true);
begin
  btn_editar_compositor.Enabled:= valor;
  btn_excluir_compositor.Enabled:= valor;
end;

procedure Tfrm_principal.cadastrar_compositor;
begin

  habilitar_botoes(false);

  with frm_cadastro_compositor do
  begin
    acao_inserir := true;
    ShowModal;
  end
end;

procedure Tfrm_principal.btn_excluir_compositorClick(Sender: TObject);
begin

  if(confirmaExclusao)then
  begin

    Try
      dm_principal.ibq_compositores.Delete;
      MessageDlg('Excluido com sucesso!',mtInformation,[mbOk],0);
    Except
      on E: Exception do

        if (Pos('violation of FOREIGN KEY', E.Message) <> 0)
        and(Pos('"CODIGO"', E.Message) <> 0) then
        begin
          MessageDlg('O registro deste compositor não pode ser excluído, porque já está associado a uma composição musical!',mtInformation,[mbOk],0);
          Abort;
        end;

    end;

  end;

end;

procedure Tfrm_principal.FormShow(Sender: TObject);
begin
  dm_principal.habilitar_componente();
end;

procedure Tfrm_principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm_principal.habilitar_componente(false);
end;

procedure Tfrm_principal.btn_pesquisarClick(Sender: TObject);
begin
  frm_pesquisa_compositor.ShowModal;
end;

procedure Tfrm_principal.btn_relatorioClick(Sender: TObject);
begin
   exibe_relatorio(dm_principal.frxRcompositores,'rel_compositores.fr3');
end;

end.
