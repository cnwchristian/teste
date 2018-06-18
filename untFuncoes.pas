unit untFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DBXFirebird, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls;

  procedure Banco(Tabela: TClientDataSet; Tela: TForm; Funcao: String; Tag: Integer);
  Procedure botoes(Tabela: TClientDataSet; Tela: TForm; Funcao: String; Tag: Integer);

implementation

procedure Banco(Tabela: TClientDataSet; Tela: TForm;
  Funcao: String; Tag: Integer);
begin
  if funcao = 'I' then
    tabela.insert
  else
  if funcao = 'E' then
    tabela.edit
  else
  if funcao = 'C' then
    tabela.cancel
  else
  if funcao = 'A' then
    tabela.Delete
  else
  if funcao = 'D' then
  begin
    if MessageDlg('Tem certeza que deseja excluir esse registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      tabela.delete
    else
      tabela.cancel;
  end
  else
  if funcao = 'P' then
  begin
    try
      tabela.post;
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
        Abort;
      end;
    end;
  end;
  botoes(Tabela, Tela, Funcao, Tag);
end;

procedure Botoes(Tabela: TClientDataSet; Tela: TForm;
  Funcao: String; Tag: Integer);
var i: integer;
begin
  if (funcao = 'I') or (funcao = 'E') then //Inclui - Altera
  begin
    for i:=0 to Tela.componentcount -1 do
    begin
      if (Tela.components[i] is TDBEdit) and (TDBEdit(Tela.components[i]).Tag = Tag) and (not (TDBEdit(Tela.components[i]).ReadOnly)) then
        TDBEdit(Tela.components[i]).Color := clWindow
      else
      if (Tela.components[i] is TDBCheckBox) and (TDBCheckBox(Tela.components[i]).Tag = Tag) and (not (TDBCheckBox(Tela.components[i]).ReadOnly)) then
        TDBCheckBox(Tela.components[i]).Color := clWindow
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 7) = UpperCase('btnNovo')) then
        TButton(Tela.components[i]).Enabled := False
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 10) = UpperCase('btnAlterar')) then
        TButton(Tela.components[i]).Enabled := False
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 10) = UpperCase('btnExcluir')) then
        TButton(Tela.components[i]).Enabled := False
      else
      if (Tela.components[i] is TButton) and (TButton(Tela.Components[i]).Tag = Tag) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 9) = UpperCase('btnSalvar')) then
        TButton(Tela.components[i]).Enabled := True
      else
      if (Tela.components[i] is TButton) and (TButton(Tela.Components[i]).Tag = Tag) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 11) = UpperCase('btnCancelar')) then
        TButton(Tela.components[i]).Enabled := True;
    end;
  end
  else
  begin
    for i:=0 to Tela.componentcount -1 do
    begin
      if (Tela.components[i] is TDBEdit) and (not (TDBEdit(Tela.components[i]).ReadOnly)) then
        TDBEdit(Tela.components[i]).Color := clMenuBar
      else
      if (Tela.components[i] is TDBCheckBox) and (not (TDBCheckBox(Tela.components[i]).ReadOnly)) then
        TDBCheckBox(Tela.components[i]).Color := clMenuBar
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 7) = UpperCase('btnNovo')) then
        TButton(Tela.components[i]).Enabled := True
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 10) = UpperCase('btnAlterar')) then
        TButton(Tela.components[i]).Enabled := True
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 10) = UpperCase('btnExcluir')) then
        TButton(Tela.components[i]).Enabled := True
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 9) = UpperCase('btnSalvar')) then
        TButton(Tela.components[i]).Enabled := False
      else
      if (Tela.components[i] is TButton) and (copy(UpperCase(TButton(Tela.components[i]).name), 1, 11) = UpperCase('btnCancelar')) then
        TButton(Tela.components[i]).Enabled := False;
    end;
  end;
  Tela.Repaint;
end;

end.
