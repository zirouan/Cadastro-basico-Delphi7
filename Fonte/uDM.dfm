object DM: TDM
  OldCreateOrder = False
  Left = 532
  Top = 478
  Height = 150
  Width = 215
  object ADOConect: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=dev;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=DataDica;Data Source=Rudson'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object qrBairro: TADOQuery
    Active = True
    Connection = ADOConect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM BAIRROS')
    Left = 108
    Top = 20
  end
end
