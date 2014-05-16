object fapPrincipal: TfapPrincipal
  Left = 339
  Top = 189
  Width = 979
  Height = 563
  Caption = 'Sistema de Estudo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 28
    Top = 16
    object mmCadastro: TMenuItem
      Caption = '&1. Cadastro'
      object mmBairros: TMenuItem
        Caption = '&1. Bairro'
        OnClick = mmBairrosClick
      end
    end
  end
end
