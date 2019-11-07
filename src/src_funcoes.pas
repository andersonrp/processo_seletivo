unit src_funcoes;

interface

uses DateUtils, StdCtrls, SysUtils, Dialogs, Controls, Forms, frxClass;

{
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, frxClass, frxDBSet;
}

 function SoNumero(fField : String): String;
 function SoLetra(Texto: String):Boolean;
 function validaAno(ano:Integer):Boolean;
 function campoVazio(edit: TEdit):Boolean;
 function confirmaExclusao():boolean;
 function get_path_sistema: String;
 function get_path_relatorio(nome_relatorio: string): string;
 procedure exibe_relatorio(frx_report: TfrxReport; nome_arquivo: string);

implementation


function SoNumero(fField : String): String;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(fField) do
       if fField [I] In ['0'..'9'] Then
            Result := Result + fField [I];
end;

function SoLetra(Texto: String):Boolean;
var Resultado:Boolean;
    nContador:Integer;
begin

  Resultado := true;

  For nContador:=1 to Length(Texto) do
    begin
      {Verifica sé é uma letra}
      if  Texto[nContador] in ['a'..'z','A'..'Z',' '] then
      else
         Resultado := false;
    end;

    Result:=Resultado;
end;

function validaAno(ano:Integer):Boolean;
var
  resultado :Boolean;
begin

  resultado := true;

  if((ano < 1500) or (ano > (YearOf(Today)-50)))then resultado := false;

  Result:= resultado;

end;

function campoVazio(edit: TEdit):Boolean;
var
  resultado :Boolean;
begin

  resultado := False;

  if(trim(edit.Text) = '')then
    resultado:= true;

  Result:= resultado;

end;

function confirmaExclusao():boolean;
var
  resultado:Boolean;
  texto:string;
begin

  resultado := false;
  texto:= 'Você tem certeza que deseja excluir o registro?';

  if (MessageDlg(texto,mtConfirmation,[mbyes,mbno],0)=mryes) then
  begin
    resultado:= true;
  end;

  Result:= resultado;

end;


function get_path_sistema: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function get_path_relatorio(nome_relatorio: string): string;
var
  path:string;
begin
  if(FileExists(get_path_sistema + '\frx\'+nome_relatorio))then
    path := get_path_sistema + '\frx\'+nome_relatorio //Path 'Executaveis'
  else
    path := get_path_sistema + '..\frx\'+nome_relatorio; //Path 'Local'
  Result := path;
end;


procedure exibe_relatorio(frx_report: TfrxReport; nome_arquivo: string);
begin
  Screen.Cursor := crHourGlass;

  with frx_report do
  begin
    LoadFromFile(get_path_relatorio(nome_arquivo));
    ShowReport;
  end;

  Screen.Cursor := crDefault;
end;


end.

