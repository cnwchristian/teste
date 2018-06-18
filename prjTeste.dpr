program prjTeste;

uses
  Vcl.Forms,
  untCalculadora in 'untCalculadora.pas' {formCalculadora},
  untFuncionario in 'untFuncionario.pas' {formFuncionario},
  untFuncoes in 'untFuncoes.pas',
  untMenu in 'untMenu.pas' {formMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMenu, formMenu);
  Application.Run;
end.
