unit uapPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfapPrincipal = class(TForm)
    MainMenu: TMainMenu;
    mmCadastro: TMenuItem;
    mmBairros: TMenuItem;
    procedure mmBairrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fapPrincipal: TfapPrincipal;

implementation

uses ucaBairros;

{$R *.dfm}

procedure TfapPrincipal.mmBairrosClick(Sender: TObject);
begin
  if ( fcaBairros = nil ) then
  begin
    Application.CreateForm( TfcaBairros, fcaBairros );
  end;

  fcaBairros.Show();
end;

end.
