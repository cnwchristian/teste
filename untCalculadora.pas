unit untCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TformCalculadora = class(TForm)
    edtVisor: TEdit;
    lbSubTotal: TLabel;
    btnDividir: TButton;
    btnMultiplicar: TButton;
    btnSubtrair: TButton;
    btnSomar: TButton;
    btnResultado: TButton;
    btnLimpar: TButton;
    btn0: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btnVirgula: TButton;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edtVisorKeyPress(Sender: TObject; var Key: Char);
    procedure btn0Click(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
  private
    { Private declarations }
    vrValorInfo: Double;
    vrValorResulto: Double;
    vrGuardaValorSeIgual: Double;
    vrOperacao: String;
    vrOperacaoArmazenada: String;
    vrTemResulto: Boolean;
    procedure Calcular;
  public
    { Public declarations }
    vuValorImpostoA: Double;
    vuValorImpostoB: Double;
    vuTemImpostoA: Boolean;
    vuTemImpostoB: Boolean;
    function ImpostoA(valorBase: string): Double;
    function ImpostoB(impostoA: Double): Double;
    function ImpostoC(impostoA, impostoB: Double): Double;
  end;

var
  formCalculadora: TformCalculadora;

implementation

{$R *.dfm}

procedure TformCalculadora.FormCreate(Sender: TObject);
begin
  {Inicializa variaveis necessarias para os calculos}
  vrTemResulto := False;
  vuTemImpostoA := False;
  vuTemImpostoB := False;
end;

procedure TformCalculadora.edtVisorKeyPress(Sender: TObject; var Key: Char);
begin
  {Se a tecla digitada não for numero, virgula ou backspace}
  if not (key in['0'..'9', #08, #44]) then
    key := #0;

  {Se a tecla digitada for / * - + executa o botao de operador}
  if (key in[#42, #43, #45, #47]) then
    btnResultado.Click;
end;

procedure TformCalculadora.btn0Click(Sender: TObject);
begin
  {O visor recebe o numero do botão}
  edtVisor.Text := edtVisor.Text + TButton(Sender).Caption;
end;

procedure TformCalculadora.btnDividirClick(Sender: TObject);
begin
  {Nao permite passar vazio para executar uma operação}
  if edtVisor.Text <> '' then
  begin
    vrValorInfo := StrToFloat(edtVisor.Text);
    vrOperacao := TButton(Sender).Caption;

    Calcular();
  end;

  edtVisor.SetFocus;
end;

procedure TformCalculadora.Calcular;
begin
  {vrTemResulto = Variavel que mostra se tem um valor para ser usado em uma operacao,
   pois o valor do resultado pode ser 0 ou negativo, impossibilitando um if vrValorResultado > 0}

  {verifica se tem um resultado para executar uma operacao ou se esta clicando em IGUAL}
  if (vrTemResulto) or (vrOperacao = '=') then
  begin
    {Se clicou em igual, guarda o valor base da operação caso seja clicado em igual novamente}
    if lbSubTotal.Caption = '' then
      vrValorInfo := vrGuardaValorSeIgual;

    {Executa conforme a operacao clicada}
    if vrOperacaoArmazenada <> '' then
    begin
      case vrOperacaoArmazenada[1] of
        '+': vrValorResulto := vrValorResulto + vrValorInfo;
        '-': vrValorResulto := vrValorResulto - vrValorInfo;
        '/': vrValorResulto := vrValorResulto / vrValorInfo;
        '*': vrValorResulto := vrValorResulto * vrValorInfo;
      end;
    end;

    if vrOperacao = '=' then
    begin
      {Se clicou em igual, guarda o valor base da operação caso seja clicado em igual novamente}
      vrGuardaValorSeIgual := vrValorInfo;
      edtVisor.Text := FloatToStr(vrValorResulto);
      lbSubTotal.Caption := '';

      vrTemResulto := False;
    end
    else
    begin
      {Se clicou em uma operacao e tinha um resultado, mostra no subtotal}
      lbSubTotal.Caption := FloatToStr(vrValorResulto) + ' ' + vrOperacao;
      edtVisor.Text := '';

      vrTemResulto := True;
    end;
  end
  else
  begin
    {Como não possui um resultado apenas armazena um subtotal para ser usado no proximo comando}
    lbSubTotal.Caption := FloatToStr(vrValorInfo) + ' ' + vrOperacao;
    edtVisor.Text := '';

    vrValorResulto := vrValorInfo;
    vrTemResulto := True;
  end;

  {Se nao clicou em IGUAL armazena o operador para ser usado no proximo comando}
  if vrOperacao <> '=' then
    vrOperacaoArmazenada := vrOperacao;
end;

procedure TformCalculadora.btnLimparClick(Sender: TObject);
begin
  {Zera valores das variaveis e componentes para começar os calculos novamente}
  vrValorInfo := 0;
  vrValorResulto := 0;
  vrGuardaValorSeIgual := 0;
  vrOperacao := '';
  edtVisor.Text := '';
  lbSubTotal.Caption := '';
  vrOperacaoArmazenada := '';
  vrTemResulto := False;
  vuTemImpostoA := False;
  vuTemImpostoB := False;
  edtVisor.SetFocus;
end;

function TformCalculadora.ImpostoA(valorBase: string): Double;
begin
  {Nao permite passar vazio para executar uma operação}
  if valorBase <> '' then
  begin
    vuValorImpostoA := StrToFloat(valorBase);
    vuValorImpostoA := (vuValorImpostoA * 0.2) - 500;

    {Utiliza variavel booleana pois o resultado pode ser 0 ou negativo}
    vuTemImpostoA := True;

    Result := vuValorImpostoA;
  end
  else
  begin
    ShowMessage('Nenhum valor informado!');
    edtVisor.SetFocus;
  end;
end;

function TformCalculadora.ImpostoB(impostoA: Double): Double;
begin
  {Calcula imposto B apenas se imposto A estiver calculado}
  if vuTemImpostoA then
  begin
    vuValorImpostoB := vuValorImpostoA - 15;

    {Utiliza variavel booleana pois o resultado pode ser 0 ou negativo}
    vuTemImpostoA := False;
    vuTemImpostoB := True;

    Result := vuValorImpostoB;
  end
  else
    ShowMessage('Imposto A não calculado!');
end;

function TformCalculadora.ImpostoC(impostoA, impostoB: Double): Double;
begin
  {Calcula imposto C apenas se imposto B estiver calculado}
  if vuTemImpostoB then
    Result := vuValorImpostoA + vuValorImpostoB
  else
    ShowMessage('Imposto B não calculado!');
end;

procedure TformCalculadora.btnImpostoAClick(Sender: TObject);
begin
  edtVisor.Text := FloatToStr(ImpostoA(edtVisor.Text));
end;

procedure TformCalculadora.btnImpostoBClick(Sender: TObject);
begin
  edtVisor.Text := FloatToStr(ImpostoB(vuValorImpostoA));
end;

procedure TformCalculadora.btnImpostoCClick(Sender: TObject);
begin
  edtVisor.Text := FloatToStr(ImpostoC(vuValorImpostoA, vuValorImpostoB));
end;

end.
