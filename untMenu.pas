unit untMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TformMenu = class(TForm)
    btnCalculadora: TButton;
    btnFuncionario: TButton;
    procedure btnCalculadoraClick(Sender: TObject);
    procedure btnFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenu: TformMenu;

implementation

{$R *.dfm}

uses untFuncionario, untCalculadora;

procedure TformMenu.btnCalculadoraClick(Sender: TObject);
begin
  formCalculadora := TformCalculadora.Create(Application);
  formCalculadora.ShowModal;
  FreeAndNil(formCalculadora);
end;

procedure TformMenu.btnFuncionarioClick(Sender: TObject);
begin
  formFuncionario := TformFuncionario.Create(Application);
  formFuncionario.ShowModal;
  FreeAndNil(formFuncionario);
end;

end.
