object formFuncionario: TformFuncionario
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rio'
  ClientHeight = 500
  ClientWidth = 750
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
  object pcFuncionario: TPageControl
    Left = 0
    Top = 34
    Width = 750
    Height = 466
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    TabWidth = 80
    ExplicitTop = 36
    object TabSheet1: TTabSheet
      Caption = 'Lista'
      ExplicitHeight = 472
      object gdFuncionario: TDBGrid
        Left = 0
        Top = 0
        Width = 742
        Height = 438
        Align = alClient
        DataSource = dsFuncionario
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = gdFuncionarioDblClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      ExplicitLeft = 3
      object Label1: TLabel
        Left = 31
        Top = 14
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Codigo'
      end
      object Label2: TLabel
        Left = 37
        Top = 41
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 16
        Top = 68
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sal'#225'rio R$'
      end
      object edtIDFuncionario: TDBEdit
        Left = 76
        Top = 11
        Width = 121
        Height = 21
        DataField = 'IDFUNCIONARIO'
        DataSource = dsFuncionario
        Enabled = False
        TabOrder = 0
      end
      object edtNomeFuncionario: TDBEdit
        Left = 76
        Top = 38
        Width = 449
        Height = 21
        DataField = 'NOME'
        DataSource = dsFuncionario
        TabOrder = 1
      end
      object edtSalarioFuncionario: TDBEdit
        Left = 76
        Top = 65
        Width = 121
        Height = 21
        DataField = 'SALARIO'
        DataSource = dsFuncionario
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 95
        Width = 742
        Height = 229
        Align = alBottom
        Caption = 'Dependentes'
        TabOrder = 3
        ExplicitTop = 112
        object Panel3: TPanel
          Left = 2
          Top = 15
          Width = 738
          Height = 34
          Align = alTop
          Color = clMedGray
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 740
          object btnNovoD1: TButton
            Tag = 1
            Left = 6
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Novo'
            TabOrder = 0
            OnClick = btnNovoD1Click
          end
          object btnAlterarD1: TButton
            Tag = 1
            Left = 84
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Alterar'
            TabOrder = 1
            OnClick = btnAlterarD1Click
          end
          object btnExcluirD1: TButton
            Tag = 1
            Left = 162
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 2
            OnClick = btnExcluirD1Click
          end
          object DBNavigator2: TDBNavigator
            Left = 622
            Top = 5
            Width = 112
            Height = 25
            DataSource = dsFDependente
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            TabOrder = 3
          end
        end
        object pcDependente: TPageControl
          Left = 2
          Top = 49
          Width = 738
          Height = 178
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 1
          TabWidth = 80
          ExplicitHeight = 235
          object TabSheet3: TTabSheet
            Caption = 'Lista'
            ExplicitLeft = 7
            ExplicitHeight = 239
            object gdFDependente: TDBGrid
              Left = 0
              Top = 0
              Width = 730
              Height = 150
              Align = alClient
              DataSource = dsFDependente
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDblClick = gdFDependenteDblClick
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Dados'
            ImageIndex = 1
            ExplicitHeight = 207
            object Label4: TLabel
              Left = 31
              Top = 14
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Codigo'
            end
            object Label5: TLabel
              Left = 37
              Top = 41
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nome'
            end
            object edtIDFDependente: TDBEdit
              Tag = 1
              Left = 76
              Top = 11
              Width = 121
              Height = 21
              DataField = 'IDDEPENDENTE'
              DataSource = dsFDependente
              Enabled = False
              TabOrder = 0
            end
            object edtNomeFDependente: TDBEdit
              Tag = 1
              Left = 76
              Top = 38
              Width = 449
              Height = 21
              DataField = 'NOME'
              DataSource = dsFDependente
              TabOrder = 1
            end
            object cbCalculaIRFDependente: TDBCheckBox
              Tag = 1
              Left = 76
              Top = 65
              Width = 97
              Height = 17
              Caption = 'Calcula IR'
              DataField = 'CALCULAIR'
              DataSource = dsFDependente
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbCalculaINSSFDependente: TDBCheckBox
              Tag = 1
              Left = 76
              Top = 88
              Width = 97
              Height = 17
              Caption = 'Calcula INSS'
              DataField = 'CALCULAINSS'
              DataSource = dsFDependente
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object Panel4: TPanel
              Left = 0
              Top = 116
              Width = 730
              Height = 34
              Align = alBottom
              Color = clScrollBar
              ParentBackground = False
              TabOrder = 4
              ExplicitLeft = -24
              ExplicitTop = 170
              object btnSalvarD1: TButton
                Tag = 1
                Left = 572
                Top = 5
                Width = 75
                Height = 25
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = btnSalvarD1Click
              end
              object btnCancelarD1: TButton
                Tag = 1
                Left = 650
                Top = 5
                Width = 75
                Height = 25
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = btnCancelarD1Click
              end
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 404
        Width = 742
        Height = 34
        Align = alBottom
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 4
        ExplicitLeft = -3
        ExplicitTop = 414
        object btnSalvarM: TButton
          Left = 582
          Top = 5
          Width = 78
          Height = 25
          Caption = 'Salvar'
          TabOrder = 0
          OnClick = btnSalvarMClick
        end
        object btnCancelarM: TButton
          Left = 662
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnCancelarMClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 324
        Width = 742
        Height = 80
        Align = alBottom
        Caption = 'Calculos'
        TabOrder = 5
        ExplicitLeft = -3
        object Label6: TLabel
          Left = 53
          Top = 52
          Width = 11
          Height = 13
          Alignment = taRightJustify
          Caption = 'IR'
        end
        object Label7: TLabel
          Left = 41
          Top = 25
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'INSS'
        end
        object edtIRCalculado: TEdit
          Left = 76
          Top = 49
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtINSSCalculado: TEdit
          Left = 76
          Top = 22
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object btnCalcular: TButton
          Left = 216
          Top = 32
          Width = 75
          Height = 25
          Caption = 'Calcular'
          TabOrder = 2
          OnClick = btnCalcularClick
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 34
    Align = alTop
    Color = clMedGray
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = -6
    object btnNovoM: TButton
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoMClick
    end
    object btnAlterarM: TButton
      Left = 83
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarMClick
    end
    object btnExcluirM: TButton
      Left = 161
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirMClick
    end
    object DBNavigator1: TDBNavigator
      Left = 634
      Top = 5
      Width = 112
      Height = 25
      DataSource = dsFuncionario
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 3
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = sdsFuncionario
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 288
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM FUNCIONARIO'
    Params = <>
    ProviderName = 'dspFuncionario'
    BeforeEdit = cdsFuncionarioBeforeEdit
    BeforePost = cdsFuncionarioBeforePost
    AfterPost = cdsFuncionarioAfterPost
    AfterDelete = cdsFuncionarioAfterPost
    OnReconcileError = cdsFuncionarioReconcileError
    Left = 640
    Top = 288
    object cdsFuncionarioIDFUNCIONARIO: TSmallintField
      DisplayLabel = 'CODIGO'
      FieldName = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFuncionarioSALARIO: TFMTBCDField
      DisplayLabel = 'SAL'#193'RIO R$'
      FieldName = 'SALARIO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
  end
  object dsFuncionario: TDataSource
    DataSet = cdsFuncionario
    Left = 688
    Top = 288
  end
  object dspFDependente: TDataSetProvider
    DataSet = sdsFDependente
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 344
  end
  object cdsFDependente: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM FUNCIONARIODEPENDENTE'
    IndexFieldNames = 'IDFUNCIONARIO;IDDEPENDENTE'
    MasterFields = 'IDFUNCIONARIO'
    MasterSource = dsFuncionario
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspFDependente'
    BeforeEdit = cdsFDependenteBeforeEdit
    BeforePost = cdsFDependenteBeforePost
    AfterPost = cdsFDependenteAfterPost
    AfterDelete = cdsFDependenteAfterPost
    OnReconcileError = cdsFDependenteReconcileError
    Left = 640
    Top = 344
    object cdsFDependenteIDDEPENDENTE: TSmallintField
      DisplayLabel = 'CODIGO'
      FieldName = 'IDDEPENDENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFDependenteIDFUNCIONARIO: TSmallintField
      FieldName = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsFDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFDependenteCALCULAIR: TStringField
      FieldName = 'CALCULAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsFDependenteCALCULAINSS: TStringField
      FieldName = 'CALCULAINSS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsFDependente: TDataSource
    DataSet = cdsFDependente
    Left = 688
    Top = 344
  end
  object sqlConexaoBanco: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database='
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 456
    Top = 288
  end
  object sdsFuncionario: TSQLDataSet
    CommandText = 'SELECT * FROM FUNCIONARIO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexaoBanco
    Left = 544
    Top = 288
  end
  object sdsFDependente: TSQLDataSet
    CommandText = 'SELECT * FROM FUNCIONARIODEPENDENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexaoBanco
    Left = 544
    Top = 344
  end
  object sdsAux: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexaoBanco
    Left = 544
    Top = 400
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 688
    Top = 400
  end
  object dspAux: TDataSetProvider
    DataSet = sdsAux
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 400
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 640
    Top = 400
  end
end
