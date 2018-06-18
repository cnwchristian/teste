object formCalculadora: TformCalculadora
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 296
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbSubTotal: TLabel
    Left = 261
    Top = 15
    Width = 3
    Height = 13
    Alignment = taRightJustify
  end
  object edtVisor: TEdit
    Left = 28
    Top = 34
    Width = 237
    Height = 31
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtVisorKeyPress
  end
  object btnDividir: TButton
    Left = 28
    Top = 80
    Width = 30
    Height = 25
    Caption = '/'
    TabOrder = 1
    OnClick = btnDividirClick
  end
  object btnMultiplicar: TButton
    Left = 79
    Top = 80
    Width = 30
    Height = 25
    Caption = '*'
    TabOrder = 2
    OnClick = btnDividirClick
  end
  object btnSubtrair: TButton
    Left = 131
    Top = 80
    Width = 30
    Height = 25
    Caption = '-'
    TabOrder = 3
    OnClick = btnDividirClick
  end
  object btnSomar: TButton
    Left = 183
    Top = 80
    Width = 30
    Height = 25
    Caption = '+'
    TabOrder = 4
    OnClick = btnDividirClick
  end
  object btnResultado: TButton
    Left = 235
    Top = 80
    Width = 30
    Height = 25
    Caption = '='
    TabOrder = 5
    OnClick = btnDividirClick
  end
  object btnLimpar: TButton
    Left = 28
    Top = 204
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btnLimparClick
  end
  object btn7: TButton
    Left = 28
    Top = 111
    Width = 75
    Height = 25
    Caption = '7'
    TabOrder = 7
    OnClick = btn0Click
  end
  object btn8: TButton
    Left = 109
    Top = 111
    Width = 75
    Height = 25
    Caption = '8'
    TabOrder = 8
    OnClick = btn0Click
  end
  object btn5: TButton
    Left = 109
    Top = 142
    Width = 75
    Height = 25
    Caption = '5'
    TabOrder = 9
    OnClick = btn0Click
  end
  object btn4: TButton
    Left = 28
    Top = 142
    Width = 75
    Height = 25
    Caption = '4'
    TabOrder = 10
    OnClick = btn0Click
  end
  object btn2: TButton
    Left = 109
    Top = 173
    Width = 75
    Height = 25
    Caption = '2'
    TabOrder = 11
    OnClick = btn0Click
  end
  object btn9: TButton
    Left = 190
    Top = 111
    Width = 75
    Height = 25
    Caption = '9'
    TabOrder = 12
    OnClick = btn0Click
  end
  object btn1: TButton
    Left = 28
    Top = 173
    Width = 75
    Height = 25
    Caption = '1'
    TabOrder = 13
    OnClick = btn0Click
  end
  object btn0: TButton
    Left = 109
    Top = 204
    Width = 75
    Height = 25
    Caption = '0'
    TabOrder = 14
    OnClick = btn0Click
  end
  object btn6: TButton
    Left = 190
    Top = 142
    Width = 75
    Height = 25
    Caption = '6'
    TabOrder = 15
    OnClick = btn0Click
  end
  object btnVirgula: TButton
    Left = 190
    Top = 204
    Width = 75
    Height = 25
    Caption = ','
    TabOrder = 16
    OnClick = btn0Click
  end
  object btn3: TButton
    Left = 190
    Top = 173
    Width = 75
    Height = 25
    Caption = '3'
    TabOrder = 17
    OnClick = btn0Click
  end
  object btnImpostoA: TButton
    Left = 28
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Imposto A'
    TabOrder = 18
    OnClick = btnImpostoAClick
  end
  object btnImpostoB: TButton
    Left = 109
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Imposto B'
    TabOrder = 19
    OnClick = btnImpostoBClick
  end
  object btnImpostoC: TButton
    Left = 190
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Imposto C'
    TabOrder = 20
    OnClick = btnImpostoCClick
  end
end
