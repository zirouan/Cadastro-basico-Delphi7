object DM: TDM
  OldCreateOrder = False
  Left = 532
  Top = 478
  Height = 150
  Width = 215
  object ADOConect: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object qrBairro: TADOQuery
    Connection = ADOConect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM BAIRROS')
    Left = 108
    Top = 20
  end
end
