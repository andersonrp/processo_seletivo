program RepertorioPianistico;

uses
  Forms,
  src_principal in 'src\src_principal.pas' {frm_principal},
  src_dm_principal in 'src\src_dm_principal.pas' {dm_principal: TDataModule},
  src_cadastro_compositor in 'src\src_cadastro_compositor.pas' {frm_cadastro_compositor},
  src_funcoes in 'src\src_funcoes.pas',
  src_pesquisa_compositor in 'src\src_pesquisa_compositor.pas' {frm_pesquisa_compositor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(Tdm_principal, dm_principal);
  Application.CreateForm(Tfrm_cadastro_compositor, frm_cadastro_compositor);
  Application.CreateForm(Tfrm_pesquisa_compositor, frm_pesquisa_compositor);
  Application.Run;
end.
