unit src_cadastro_compositor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrm_cadastro_compositor = class(TForm)
    edt_nome_compositor: TEdit;
    lbl_nome_compositor: TLabel;
    edt_ano_nasc_compositor: TEdit;
    lbl_ano_nasc_compositor: TLabel;
    edt_ano_falec_compositor: TEdit;
    lbl_ano_falec_compositor: TLabel;
    btn_salvar_compositor: TButton;
    btn_cancelar: TButton;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvar_compositorClick(Sender: TObject);
    procedure edt_ano_nasc_compositorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ano_falec_compositorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_nome_compositorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_nome_compositorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ano_nasc_compositorKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edt_ano_falec_compositorKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure limpa_campos;
    procedure reinicia_variaveis;
    procedure salvar_compositor;
    function valida_campos():Boolean;
  public
    { Public declarations }
    acao_editar:Boolean;
    acao_inserir:Boolean;
  end;

var
  frm_cadastro_compositor: Tfrm_cadastro_compositor;

implementation

uses src_dm_principal, DB, IBQuery, IBCustomDataSet, src_funcoes;

{$R *.dfm}

procedure Tfrm_cadastro_compositor.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cadastro_compositor.limpa_campos;
begin
  with frm_cadastro_compositor do
  begin
    edt_nome_compositor.Clear;
    edt_ano_nasc_compositor.Clear;
    edt_ano_falec_compositor.Clear;
  end
end;

procedure Tfrm_cadastro_compositor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  limpa_campos;
  reinicia_variaveis;
end;

procedure Tfrm_cadastro_compositor.salvar_compositor;
begin

  if(valida_campos = false)then Exit;
  

  with dm_principal.ibq_compositores do
  begin
    if(acao_editar) then Edit else Insert;

    //Campos obrigatórios já validados pela função "valida_campos".
    FieldByName('nome').AsString := edt_nome_compositor.Text;
    FieldByName('ano_nascimento').AsInteger := StrToInt(edt_ano_nasc_compositor.Text);

    //Verifica se o campo não obrigatório está vazio para aplicar a função StrToInt
    if(not campoVazio(edt_ano_falec_compositor))then
    begin
      FieldByName('ano_falecimento').AsInteger := StrToInt(edt_ano_falec_compositor.Text);
    end;
    Post;
  end;

  MessageDlg('Salvo com sucesso!',mtInformation,[mbOk],0);
  limpa_campos;

  if(acao_editar)then Close else edt_nome_compositor.SetFocus;

end;

procedure Tfrm_cadastro_compositor.reinicia_variaveis;
begin
  acao_inserir:= false;
  acao_editar:= false;
end;


procedure Tfrm_cadastro_compositor.btn_salvar_compositorClick(
  Sender: TObject);
begin
  salvar_compositor;
end;

function Tfrm_cadastro_compositor.valida_campos():Boolean;
var
  resultado:Boolean;
begin

  resultado:= true;

  if(campoVazio(edt_nome_compositor))then
  begin
    MessageDlg('Informe o nome do compositor!',mtInformation,[mbOk],0);
    edt_nome_compositor.SetFocus;
    resultado := false;
  end;

  if(campoVazio(edt_ano_nasc_compositor) and resultado)then
  begin
    MessageDlg('Informe o ano de nascimento do compositor!',mtInformation,[mbOk],0);
    edt_ano_nasc_compositor.SetFocus;
    resultado:= false;
  end;

  if(not campoVazio(edt_ano_nasc_compositor) and resultado)then
  begin

    if(not validaAno(StrToInt(edt_ano_nasc_compositor.Text)))then
    begin
      MessageDlg('Ano inválido!',mtInformation,[mbOk],0);
      edt_ano_nasc_compositor.SetFocus;
      resultado:= false;
    end;

  end;


  Result := resultado;


end;

procedure Tfrm_cadastro_compositor.edt_ano_nasc_compositorKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  (Sender as TEdit).Text := SoNumero((Sender as TEdit).Text);

end;

procedure Tfrm_cadastro_compositor.edt_ano_falec_compositorKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  (Sender as TEdit).Text := SoNumero((Sender as TEdit).Text);
end;

procedure Tfrm_cadastro_compositor.edt_nome_compositorKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if(not SoLetra((Sender as TEdit).Text))then
  begin
    (Sender as TEdit).Text := '';
  end;


end;

procedure Tfrm_cadastro_compositor.FormShow(Sender: TObject);
begin
  edt_nome_compositor.SetFocus;
end;

procedure Tfrm_cadastro_compositor.edt_nome_compositorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //Tecla Enter
  If(Key = 13)then edt_ano_nasc_compositor.SetFocus;
end;

procedure Tfrm_cadastro_compositor.edt_ano_nasc_compositorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //Tecla Enter
  If(Key = 13)then edt_ano_falec_compositor.SetFocus;
end;

procedure Tfrm_cadastro_compositor.edt_ano_falec_compositorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    //Tecla Enter
  If(Key = 13)then btn_salvar_compositor.SetFocus;
end;

end.
