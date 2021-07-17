unit Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, Vcl.Forms,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, Vcl.Dialogs,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,{IWSystem ,}
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TFDados = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    QryAux: TFDQuery;
    QryFuncionarios: TFDQuery;
    QryFolha: TFDQuery;
    dsFuncionarios: TDataSource;
    dsFolha: TDataSource;
    QryFolhaid: TIntegerField;
    QryFolhamatricula: TIntegerField;
    QryFolhadias_trabalhado: TBCDField;
    QryFolhavalor_dias_trabalhado: TBCDField;
    QryFolhahoras_extra_50: TBCDField;
    QryFolhavalor_horas_extra_50: TBCDField;
    QryFolhahoras_extra_75: TBCDField;
    QryFolhavalor_horas_extra_75: TBCDField;
    QryFolhahoras_extra_100: TBCDField;
    QryFolhavalor_horas_extra_100: TBCDField;
    QryFolhadesconto_inss_padrao: TBCDField;
    QryFolhadesconto_inss: TBCDField;
    QryFolhavigencia: TWideStringField;
    QryFolhatotal_proventos: TBCDField;
    QryFolhatotal_descontos: TBCDField;
    QryFolhatotal_receber: TBCDField;
    QryFuncionariosmatricula: TIntegerField;
    QryFuncionariosnome: TWideStringField;
    QryFuncionariossalario: TBCDField;
    QryFuncionarioshora_mes: TBCDField;
    QryFuncionarioscpf: TWideStringField;
    QryFuncionariosnis: TWideStringField;
    QryFuncionariostipo_folha: TWideStringField;
  private
    { Private declarations }
  public
    function ConfiguraConexao: Boolean;
    function ReConfiguraConexao: Boolean;
    function CriaBancodeDados: Boolean;
    function CriaTabelaFuncionario: Boolean;
    function CriaTabelaFolha_Pagamento: Boolean;
    procedure LeConfig;
  end;

var
  FDados: TFDados;
  vLogin: string;
  vSenha: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses GerBanco;

// Configura Conexão com Banco PostgreSQL
function TFDados.ConfiguraConexao: Boolean;
begin
  // Definindo Caminho do DLL
  FDPhysPgDriverLink.VendorLib:=ExtractFilePath(Application.ExeName)+'libpq.dll';

  LeConfig;

  try
    Result:=ReConfiguraConexao;
  except
    // Definindo Parametros de Conexão
    with FDConnection do
    begin
      try
        Close;
        Connected := False;
        Params.Clear;
        Params.Add('Pooled=False');
        Params.Add('Server=');
        Params.Add('User_Name='+vlogin);
        Params.Add('Password='+vSenha);
        Params.Add('Port=5432');
        Params.Add('Database=');
        Params.Add('DriverID=PG');
        Params.Add('CharacterSet=UTF8');
        Connected := True;
        Result := Connected;
        Connected := False;
      except
        GerBanco.FGerBanco.ShowModal;
        ConfiguraConexao;
      end;
    end;
  end;
end;

// Cria Tabela funcionarios
function TFDados.CriaTabelaFuncionario: Boolean;
begin
  QryAux.Close;
  QryAux.SQL.Text:=' CREATE TABLE IF NOT EXISTS funcionarios ('+
                   '   matricula integer,'+
                   '   nome varchar(150),'+
                   '   salario numeric(10,2),'+
                   '   hora_mes numeric(10,2),'+
                   '   cpf varchar(150),'+
                   '   nis varchar(150),'+
                   '   tipo_folha varchar(50)'+
                   ' );';
  FDTransaction.StartTransaction;
  QryAux.ExecSQL;
  FDTransaction.Commit;
end;

// Cria Tabela folha_pagamento
function TFDados.CriaTabelaFolha_Pagamento: Boolean;
begin
  QryAux.Close;
  QryAux.SQL.Text:=' CREATE TABLE IF NOT EXISTS folha_pagamento ('+
                   '  id integer,'+
                   ' 	matricula integer,'+
                   ' 	dias_trabalhado numeric(10,2),'+
                   ' 	valor_dias_trabalhado numeric(10,2),'+
                   ' 	horas_extra_50 numeric(10,2),'+
                   ' 	valor_horas_extra_50 numeric(10,2),'+
                   ' 	horas_extra_75 numeric(10,2),'+
                   ' 	valor_horas_extra_75 numeric(10,2),'+
                   ' 	horas_extra_100 numeric(10,2),'+
                   ' 	valor_horas_extra_100 numeric(10,2),'+
                   ' 	desconto_inss_padrao numeric(10,2),'+
                   ' 	desconto_inss numeric(10,2),'+
                   ' 	vigencia varchar(100),'+
                   ' 	total_proventos numeric(10,2),'+
                   ' 	total_descontos numeric(10,2),'+
                   ' 	total_receber numeric(10,2)'+
                   ' );';
  FDTransaction.StartTransaction;
  QryAux.ExecSQL;
  FDTransaction.Commit;
end;

// Cria Banco de Dados
function TFDados.CriaBancodeDados: Boolean;
begin
  QryAux.Close;
  QryAux.SQL.Text:=' select * from pg_database where datname='+QuotedStr('testedados');
  QryAux.Open;

  if QryAux.RecordCount=0 then
  begin
    QryAux.Close;
    QryAux.SQL.Text:=' create database testedados';
    QryAux.ExecSQL;
  end;

  // Reconecta ao PG com o Bando de Dados Necessário
  ReConfiguraConexao;
end;

// Configura Conexão com Banco PostgreSQL
function TFDados.ReConfiguraConexao: Boolean;
begin
  // Redefinindo Parametros de Conexão
  with FDConnection do
  begin
    Close;
    Connected := False;
    Params.Clear;
    Params.Add('Pooled=False');
    Params.Add('Server=');
    Params.Add('User_Name='+vlogin);
    Params.Add('Password='+vSenha);
    Params.Add('Port=5432');
    Params.Add('Database=testedados');
    Params.Add('DriverID=PG');
    Params.Add('CharacterSet=UTF8');
    Connected := True;
    Result := Connected;
    Connected := False;
  end;
end;

// Abre Configuracoes de Login/Senha do Banco
procedure TFDados.LeConfig;
begin
  vLogin:=trim(GerBanco.FGerBanco.DadosLogin.Items.Strings[0]);
  vSenha:=trim(GerBanco.FGerBanco.DadosLogin.Items.Strings[1]);
end;

end.
