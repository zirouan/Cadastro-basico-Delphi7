program Dicas;

uses
  Forms,
  uapPrincipal in 'uapPrincipal.pas' {fapPrincipal},
  ucaBairros in 'ucaBairros.pas' {fcaBairros},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfapPrincipal, fapPrincipal);
  Application.Run;
end.
