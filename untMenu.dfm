object formMenu: TformMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnCalculadora: TButton
    Left = 176
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Calculadora'
    TabOrder = 0
    OnClick = btnCalculadoraClick
  end
  object btnFuncionario: TButton
    Left = 176
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Funcion'#225'rio'
    TabOrder = 1
    OnClick = btnFuncionarioClick
  end
end
