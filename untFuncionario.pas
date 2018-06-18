unit untFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DBXFirebird, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls;

type
  TformFuncionario = class(TForm)
    dspFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    dsFuncionario: TDataSource;
    dspFDependente: TDataSetProvider;
    cdsFDependente: TClientDataSet;
    dsFDependente: TDataSource;
    sqlConexaoBanco: TSQLConnection;
    sdsFuncionario: TSQLDataSet;
    sdsFDependente: TSQLDataSet;
    pcFuncionario: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gdFuncionario: TDBGrid;
    edtIDFuncionario: TDBEdit;
    edtNomeFuncionario: TDBEdit;
    edtSalarioFuncionario: TDBEdit;
    Panel1: TPanel;
    btnNovoM: TButton;
    btnAlterarM: TButton;
    btnExcluirM: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    btnNovoD1: TButton;
    btnAlterarD1: TButton;
    btnExcluirD1: TButton;
    pcDependente: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    gdFDependente: TDBGrid;
    edtIDFDependente: TDBEdit;
    edtNomeFDependente: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    cbCalculaIRFDependente: TDBCheckBox;
    cbCalculaINSSFDependente: TDBCheckBox;
    cdsFuncionarioIDFUNCIONARIO: TSmallintField;
    cdsFuncionarioNOME: TStringField;
    cdsFuncionarioSALARIO: TFMTBCDField;
    Panel2: TPanel;
    btnSalvarM: TButton;
    btnCancelarM: TButton;
    Panel4: TPanel;
    btnSalvarD1: TButton;
    btnCancelarD1: TButton;
    sdsAux: TSQLDataSet;
    dsAux: TDataSource;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    cdsFDependenteIDDEPENDENTE: TSmallintField;
    cdsFDependenteIDFUNCIONARIO: TSmallintField;
    cdsFDependenteNOME: TStringField;
    cdsFDependenteCALCULAIR: TStringField;
    cdsFDependenteCALCULAINSS: TStringField;
    edtIRCalculado: TEdit;
    edtINSSCalculado: TEdit;
    btnCalcular: TButton;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    procedure cdsFuncionarioAfterPost(DataSet: TDataSet);
    procedure cdsFuncionarioBeforePost(DataSet: TDataSet);
    procedure cdsFDependenteAfterPost(DataSet: TDataSet);
    procedure cdsFDependenteBeforePost(DataSet: TDataSet);
    procedure btnNovoMClick(Sender: TObject);
    procedure btnAlterarMClick(Sender: TObject);
    procedure btnExcluirMClick(Sender: TObject);
    procedure btnSalvarMClick(Sender: TObject);
    procedure btnCancelarMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoD1Click(Sender: TObject);
    procedure btnAlterarD1Click(Sender: TObject);
    procedure btnExcluirD1Click(Sender: TObject);
    procedure btnSalvarD1Click(Sender: TObject);
    procedure btnCancelarD1Click(Sender: TObject);
    procedure gdFuncionarioDblClick(Sender: TObject);
    procedure gdFDependenteDblClick(Sender: TObject);
    procedure cdsFuncionarioReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsFDependenteReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure btnCalcularClick(Sender: TObject);
    procedure cdsFuncionarioBeforeEdit(DataSet: TDataSet);
    procedure cdsFDependenteBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CalculaImposto;
  public
    { Public declarations }
  end;

var
  formFuncionario: TformFuncionario;

implementation

{$R *.dfm}

uses untFuncoes;

procedure TformFuncionario.btnAlterarD1Click(Sender: TObject);
begin
  pcDependente.ActivePageIndex := 1;
  Banco(cdsFDependente, Self, 'E', 1);
end;

procedure TformFuncionario.btnAlterarMClick(Sender: TObject);
begin
  pcFuncionario.ActivePageIndex := 1;
  Banco(cdsFuncionario, Self, 'E', 0);
end;

procedure TformFuncionario.btnCalcularClick(Sender: TObject);
begin
  CalculaImposto;
end;

procedure TformFuncionario.btnCancelarD1Click(Sender: TObject);
begin
  Banco(cdsFDependente, Self, 'C', 1);
end;

procedure TformFuncionario.btnCancelarMClick(Sender: TObject);
begin
  Banco(cdsFuncionario, Self, 'C', 0);
end;

procedure TformFuncionario.btnExcluirD1Click(Sender: TObject);
begin
  Banco(cdsFDependente, Self, 'D', 1);
end;

procedure TformFuncionario.btnExcluirMClick(Sender: TObject);
begin
  Banco(cdsFuncionario, Self, 'D', 0);
end;

procedure TformFuncionario.btnNovoD1Click(Sender: TObject);
begin
  pcDependente.ActivePageIndex := 1;
  Banco(cdsFDependente, Self, 'I', 1);

  cdsFDependente.FieldByName('calculair').AsString := 'N';
  cdsFDependente.FieldByName('calculainss').AsString := 'N';

  edtNomeFDependente.SetFocus;
end;

procedure TformFuncionario.btnNovoMClick(Sender: TObject);
begin
  pcFuncionario.ActivePageIndex := 1;
  Banco(cdsFuncionario, Self, 'I', 0);

  edtNomeFuncionario.SetFocus;
end;

procedure TformFuncionario.btnSalvarD1Click(Sender: TObject);
begin
  Banco(cdsFDependente, Self, 'P', 1);
end;

procedure TformFuncionario.btnSalvarMClick(Sender: TObject);
begin
  Banco(cdsFuncionario, Self, 'P', 0);
end;

procedure TformFuncionario.CalculaImposto;
var
  vlQtdeDependenteIR: Integer;
  vlQtdeDependenteINSS: Integer;
  vlValorAux: Double;
begin
  vlValorAux := 0;

  if cdsFuncionario.FieldByName('salario').AsFloat > 0 then
  begin
    cdsAux.Close;
    cdsAux.CommandText := 'select count(iddependente) as dependenteinss ' +
                          'from funcionariodependente ' +
                          'where calculainss = ''S'' and ' +
                          'idfuncionario = ' + IntToStr(cdsFuncionario.FieldByName('idfuncionario').AsInteger);
    cdsAux.Open;
    vlQtdeDependenteINSS := cdsAux.FieldByName('dependenteinss').AsInteger;

    if vlQtdeDependenteINSS > 0 then
    begin
      vlValorAux := cdsFuncionario.FieldByName('salario').AsFloat * 0.08;
      edtINSSCalculado.Text := FormatFloat('###,##0.00', vlValorAux);
    end;

    cdsAux.Close;
    cdsAux.CommandText := 'select count(iddependente) as dependenteir ' +
                          'from funcionariodependente ' +
                          'where calculair = ''S'' and ' +
                          'idfuncionario = ' + IntToStr(cdsFuncionario.FieldByName('idfuncionario').AsInteger);
    cdsAux.Open;
    vlQtdeDependenteIR := cdsAux.FieldByName('dependenteir').AsInteger;

    if vlQtdeDependenteIR > 0 then
    begin
      vlValorAux := (cdsFuncionario.FieldByName('salario').AsFloat - (vlQtdeDependenteIR * 100)) * 0.15;
      edtIRCalculado.Text := FormatFloat('###,##0.00', vlValorAux);
    end;
  end
  else
    ShowMessage('Salario não cadastrado!');
end;

procedure TformFuncionario.cdsFDependenteAfterPost(DataSet: TDataSet);
begin
  cdsFDependente.ApplyUpdates(0);
end;

procedure TformFuncionario.cdsFDependenteBeforeEdit(DataSet: TDataSet);
begin
  botoes(cdsFDependente, Self, 'E', 1);
end;

procedure TformFuncionario.cdsFDependenteBeforePost(DataSet: TDataSet);
begin
  if cdsFDependente.FieldByName('iddependente').AsInteger = 0 then
  begin
    cdsAux.Close;
    cdsAux.CommandText := 'select max(iddependente) as maiorid ' +
                          'from funcionariodependente ' +
                          'where idfuncionario = ' + IntToStr(cdsFuncionario.FieldByName('idfuncionario').AsInteger);
    cdsAux.Open;

    cdsFDependente.FieldByName('iddependente').AsInteger := cdsAux.FieldByName('maiorid').AsInteger + 1;
  end;
end;

procedure TformFuncionario.cdsFDependenteReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TformFuncionario.cdsFuncionarioAfterPost(DataSet: TDataSet);
begin
  cdsFuncionario.ApplyUpdates(0);
end;

procedure TformFuncionario.cdsFuncionarioBeforeEdit(DataSet: TDataSet);
begin
  botoes(cdsFuncionario, Self, 'E', 0);
end;

procedure TformFuncionario.cdsFuncionarioBeforePost(DataSet: TDataSet);
begin
  if cdsFuncionario.FieldByName('idfuncionario').AsInteger = 0 then
  begin
    cdsAux.Close;
    cdsAux.CommandText := 'select max(idfuncionario) as maiorid from funcionario';
    cdsAux.Open;

    cdsFuncionario.FieldByName('idfuncionario').AsInteger := cdsAux.FieldByName('maiorid').AsInteger + 1;
  end;
end;

procedure TformFuncionario.cdsFuncionarioReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TformFuncionario.FormCreate(Sender: TObject);
begin
  sqlConexaoBanco.Params.Values['Database'] := ExtractFilePath(Application.ExeName) + 'DATABASE.FDB';
  sqlConexaoBanco.Connected := True;

  cdsFuncionario.Active := True;
  cdsFDependente.Active := True;

  botoes(cdsFuncionario, Self, '', 0);
  botoes(cdsFuncionario, Self, '', 1);

  pcDependente.ActivePageIndex := 0;
  pcFuncionario.ActivePageIndex := 0;
end;

procedure TformFuncionario.gdFDependenteDblClick(Sender: TObject);
begin
  pcDependente.ActivePageIndex := 1;
end;

procedure TformFuncionario.gdFuncionarioDblClick(Sender: TObject);
begin
  pcFuncionario.ActivePageIndex := 1;
end;

end.
