object fcaBairros: TfcaBairros
  Left = 489
  Top = 358
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Bairros'
  ClientHeight = 171
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TGroupBox
    Left = 6
    Top = 47
    Width = 422
    Height = 117
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 77
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 9
      Top = 31
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object cbStatus: TComboBox
      Left = 77
      Top = 31
      Width = 103
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Ativo'
      Items.Strings = (
        'Ativo'
        'Inativo')
    end
    object edtDescricao: TEdit
      Left = 9
      Top = 74
      Width = 404
      Height = 21
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 43
    Align = alTop
    TabOrder = 1
    object sbNovo: TSpeedButton
      Left = 1
      Top = 0
      Width = 51
      Height = 41
      Hint = 'F2'
      Caption = 'Novo'
      OnClick = sbNovoClick
    end
    object sbSalvar: TSpeedButton
      Left = 51
      Top = 0
      Width = 51
      Height = 41
      Hint = 'F3'
      Caption = 'Salvar'
      Enabled = False
      OnClick = sbSalvarClick
    end
    object sbExcluir: TSpeedButton
      Left = 101
      Top = 0
      Width = 51
      Height = 41
      Hint = 'F4'
      Caption = 'Excluir'
      Enabled = False
      OnClick = sbExcluirClick
    end
    object sbFechar: TSpeedButton
      Left = 374
      Top = 0
      Width = 51
      Height = 41
      Hint = 'Esc'
      Caption = 'Fechar'
      OnClick = sbFecharClick
    end
    object sbVoltar: TSpeedButton
      Left = 191
      Top = 0
      Width = 51
      Height = 41
      Hint = 'F5'
      Caption = 'Voltar'
      Enabled = False
      OnClick = sbVoltarClick
    end
    object sbProximo: TSpeedButton
      Left = 241
      Top = 0
      Width = 51
      Height = 41
      Hint = 'F6'
      Caption = 'Proximo'
      Enabled = False
      OnClick = sbProximoClick
    end
  end
end
