unit ucaBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DB, ADODB;

type
  TfcaBairros = class(TForm)
    GroupBox: TGroupBox;
    Label1: TLabel;
    edtCodigo: TEdit;
    cbStatus: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtDescricao: TEdit;
    pnControle: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbProximo: TSpeedButton;
    sbFechar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Novo( Sender: TObject );
    procedure Salvar( Sender: TObject );
    procedure Excluir( Sender: TObject );
    procedure Voltar( Sender: TObject );
    procedure Proximo( Sender: TObject );

    function Validacao(): Boolean;

    procedure SetarCampos( qrQuery: TADOQuery );
    procedure ConsultarInformacoesBairros( TipoConsulta: Integer );       
  public
    { Public declarations }
  end;

var
  fcaBairros: TfcaBairros;

implementation

uses uDM, Math;

{$R *.dfm}

const
  SQLDEFAULT: String = 'SELECT CODIGO, DESCRICAO, STATUS ' +
                       'FROM BAIRROS ';


procedure TfcaBairros.ConsultarInformacoesBairros(TipoConsulta: Integer);
begin
  DM.qrBairro.Close();
  DM.qrBairro.SQL.Clear();
  DM.qrBairro.SQL.Add( SQLDEFAULT );

  case TipoConsulta of
    0: DM.qrBairro.SQL.Add( 'ORDER BY CODIGO DESC' );

    1: begin
         DM.qrBairro.SQL.Add( 'WHERE CODIGO < ' + edtCodigo.Text );
         DM.qrBairro.SQL.Add( 'ORDER BY CODIGO DESC' );         
       end;

    2: begin
         DM.qrBairro.SQL.Add( 'WHERE CODIGO > ' + edtCodigo.Text );
         DM.qrBairro.SQL.Add( 'ORDER BY CODIGO ASC' );
       end;
  end;

  DM.qrBairro.Prepared;
  DM.qrBairro.Open();

  if ( DM.qrBairro.IsEmpty ) then
  begin
    case TipoConsulta of
      1: begin
           ShowMessage( 'Não existe bairro anterior' );
           Abort;
         end;

      2: begin
           ShowMessage( 'Não existe bairro posterior' );
           Abort;
         end;  
    end;
  end;

  SetarCampos( DM.qrBairro );
  GroupBox.Enabled := False;
  DM.qrBairro.Close();  
end;

procedure TfcaBairros.Excluir(Sender: TObject);
begin
  try
    DM.qrBairro.Close();
    DM.qrBairro.SQL.Clear();
    DM.qrBairro.SQL.Add( 'DELETE FROM BAIRROS' );
    DM.qrBairro.SQL.Add( 'WHERE CODIGO = ' + edtCodigo.Text );
    DM.qrBairro.Prepared;
    DM.qrBairro.ExecSQL();        

  except
    ShowMessage( 'Deu erro doido :(' );
  end;

  DM.qrBairro.Close();

  ConsultarInformacoesBairros(0);
  ShowMessage( 'Excluiu doido \o/' );
end;

procedure TfcaBairros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfcaBairros.FormDestroy(Sender: TObject);
begin
  fcaBairros := nil;
end;

procedure TfcaBairros.Novo(Sender: TObject);
begin
  GroupBox.Enabled  := True;
  sbSalvar.Enabled  := True;
  sbExcluir.Enabled := False;
  sbAnterior.Enabled  := False;
  sbProximo.Enabled := False;
  sbNovo.Enabled    := False;
  edtCodigo.Clear();
  edtDescricao.Clear();
  cbStatus.ItemIndex := 0;
  edtDescricao.SetFocus();
end;

procedure TfcaBairros.Salvar(Sender: TObject);
begin

  if not( Validacao() ) then
  begin
    Abort();
  end; 

  try
    DM.qrBairro.Close();
    DM.qrBairro.SQL.Clear();
    DM.qrBairro.SQL.Add( 'INSERT INTO BAIRROS( DESCRICAO, STATUS )' );
    DM.qrBairro.SQL.Add( 'VALUES( :DESCRICAO, :STATUS )' );

    DM.qrBairro.Parameters.ParamValues['DESCRICAO'] := edtDescricao.Text;
    DM.qrBairro.Parameters.ParamValues['STATUS']    := cbStatus.ItemIndex;

    DM.qrBairro.Prepared;
    DM.qrBairro.ExecSQL();        

  except
    ShowMessage( 'Deu erro doido :(' );
  end;

  DM.qrBairro.Close();

  ConsultarInformacoesBairros(0);
  
  ShowMessage( 'Salvou doido \o/' );    
end;

procedure TfcaBairros.sbFecharClick(Sender: TObject);
begin
  Close();
end;

procedure TfcaBairros.sbNovoClick(Sender: TObject);
begin
  Novo( Sender ); 
end;

procedure TfcaBairros.sbSalvarClick(Sender: TObject);
begin
  Salvar( Sender );
end;

procedure TfcaBairros.sbExcluirClick(Sender: TObject);
begin
  Excluir( Sender );
end;

procedure TfcaBairros.Proximo(Sender: TObject);
begin
  ConsultarInformacoesBairros(2);
end;

procedure TfcaBairros.Voltar(Sender: TObject);
begin
  ConsultarInformacoesBairros(1);
end;

procedure TfcaBairros.SetarCampos(qrQuery: TADOQuery);
begin
  edtCodigo.Text     := qrQuery.FieldByName( 'CODIGO' ).AsString;
  edtDescricao.Text  := qrQuery.FieldByName( 'DESCRICAO' ).AsString;
  cbStatus.ItemIndex := qrQuery.FieldByName( 'STATUS' ).AsInteger;

  sbExcluir.Enabled := ( qrQuery.FieldByName( 'CODIGO' ).AsString <> '' );
  sbAnterior.Enabled  := ( qrQuery.FieldByName( 'CODIGO' ).AsString <> '' );
  sbProximo.Enabled := ( qrQuery.FieldByName( 'CODIGO' ).AsString <> '' );

  sbNovo.Enabled    := True;
  sbSalvar.Enabled  := False;       
end;

procedure TfcaBairros.sbAnteriorClick(Sender: TObject);
begin
  Voltar( Sender );
end;

procedure TfcaBairros.sbProximoClick(Sender: TObject);
begin
  Proximo( Sender );
end;

procedure TfcaBairros.FormShow(Sender: TObject);
begin
  ConsultarInformacoesBairros(0);
end;

function TfcaBairros.Validacao: Boolean;
begin
  Result := True;
  
  if ( Trim( edtDescricao.Text ) = '' ) then
  begin
    ShowMessage( 'Informe a descrição do bairro' );
    edtDescricao.SetFocus();
    Result := False;  
    Abort;
  end;
end;

procedure TfcaBairros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

     VK_F2: begin
              if ( sbNovo.Enabled ) then
              begin
                 sbNovo.Click();
              end; 
            end;

     VK_F3: begin
              if ( sbSalvar.Enabled ) then
              begin
                 sbSalvar.Click();
              end; 
            end;

     VK_F4: begin
              if ( sbExcluir.Enabled ) then
              begin
                 sbExcluir.Click();
              end;
            end;

     VK_F5: begin
              if ( sbAnterior.Enabled ) then
              begin
                 sbAnterior.Click();
              end;
            end;

     VK_F6: begin
              if ( sbProximo.Enabled ) then
              begin
                 sbProximo.Click();
              end;
            end;

    VK_ESCAPE: sbFechar.Click();
  end;
end;

end.

