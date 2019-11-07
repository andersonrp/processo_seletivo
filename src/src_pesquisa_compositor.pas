unit src_pesquisa_compositor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  Tfrm_pesquisa_compositor = class(TForm)
    edt_pesquisa_nome_compositor: TEdit;
    Label1: TLabel;
    btn_ok_pesquisa_compositor: TButton;
    btn_cancelar_pesquisa_compositor: TButton;
    dbg_pesquisa_compositor: TDBGrid;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelar_pesquisa_compositorClick(Sender: TObject);
    procedure btn_ok_pesquisa_compositorClick(Sender: TObject);
    procedure edt_pesquisa_nome_compositorKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbg_pesquisa_compositorDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure pesquisar_compositor;
    procedure selecionar_registro;

  public
    { Public declarations }
  end;

var
  frm_pesquisa_compositor: Tfrm_pesquisa_compositor;

implementation

uses src_dm_principal, src_principal;

{$R *.dfm}

procedure Tfrm_pesquisa_compositor.FormShow(Sender: TObject);
begin
  edt_pesquisa_nome_compositor.SetFocus;
end;

procedure Tfrm_pesquisa_compositor.btn_cancelar_pesquisa_compositorClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pesquisa_compositor.btn_ok_pesquisa_compositorClick(
  Sender: TObject);
begin
  pesquisar_compositor;
end;

procedure Tfrm_pesquisa_compositor.edt_pesquisa_nome_compositorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //Tecla Enter
  If(Key = 13)then btn_ok_pesquisa_compositor.Click;
end;

procedure Tfrm_pesquisa_compositor.pesquisar_compositor;
begin

  Screen.Cursor:= crHourGlass;

  with dm_principal.ibq_pesquisa_compositor do
  begin
    Close;
    ParamByName('nome').AsString := edt_pesquisa_nome_compositor.Text;
    Open;
    if(RecordCount > 0)
    then dbg_pesquisa_compositor.ShowHint := true
    else dbg_pesquisa_compositor.ShowHint := false;
  end;

  Screen.Cursor:= crDefault;

end;



procedure Tfrm_pesquisa_compositor.selecionar_registro;
var
  codigo_registro:Integer;
begin

  with dm_principal do
  begin
    if(ibq_pesquisa_compositor.RecordCount = 0)then Exit;
    
    codigo_registro := ibq_pesquisa_compositor.FieldByName('codigo').AsInteger;
    ibq_compositores.Locate('codigo',codigo_registro,[]);
  end;
  Close;
end;

procedure Tfrm_pesquisa_compositor.dbg_pesquisa_compositorDblClick(
  Sender: TObject);
begin
  selecionar_registro;
end;

end.
