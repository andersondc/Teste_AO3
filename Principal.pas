unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, StrUtils,
  Vcl.Imaging.jpeg, Data.DB, Vcl.Grids, Vcl.DBGrids, DateUtils, GerBanco,
  Vcl.Imaging.pngimage;

type
  TFPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PagPrincipal: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PagFuncionario: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    PagFPagamento: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    PCadFunc: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    bCancFunc: TButton;
    bCadFunc: TButton;
    Label1: TLabel;
    Label2: TLabel;
    vMatricula: TLabel;
    Label4: TLabel;
    vNome: TEdit;
    Label5: TLabel;
    vSalario: TEdit;
    Label6: TLabel;
    vHoraMes: TEdit;
    Label7: TLabel;
    vCPF: TEdit;
    Label8: TLabel;
    vNIS: TEdit;
    Label9: TLabel;
    vTipoFolha: TEdit;
    Image2: TImage;
    PCadFolha: TPanel;
    Label3: TLabel;
    vID: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel6: TPanel;
    bCanFolha: TButton;
    bCadFolha: TButton;
    vSalarioFolha: TEdit;
    vHoraMesFolha: TEdit;
    vCPFFolha: TEdit;
    vNISFolha: TEdit;
    Label17: TLabel;
    vFunc: TComboBox;
    Label16: TLabel;
    vDiasTrab: TEdit;
    Label18: TLabel;
    vValorTrab: TEdit;
    Label19: TLabel;
    vExtra75: TEdit;
    vValorExtra75: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    vExtra100: TEdit;
    Label22: TLabel;
    vValorExtra100: TEdit;
    Label23: TLabel;
    vBaseINSS: TEdit;
    Label24: TLabel;
    vDescontoINSS: TEdit;
    Label25: TLabel;
    vMes: TComboBox;
    vAno: TComboBox;
    Label26: TLabel;
    Label10: TLabel;
    vTotalProv: TEdit;
    Label27: TLabel;
    vDesconto: TEdit;
    Label28: TLabel;
    vTotal: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Image3: TImage;
    Label29: TLabel;
    Panel7: TPanel;
    Image4: TImage;
    Label30: TLabel;
    Panel8: TPanel;
    Image5: TImage;
    Label31: TLabel;
    Panel9: TPanel;
    Image6: TImage;
    Label32: TLabel;
    Image7: TImage;
    Label33: TLabel;
    vExtra50: TEdit;
    Label34: TLabel;
    vValorExtra50: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure vSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure vNomeKeyPress(Sender: TObject; var Key: Char);
    procedure bCadFuncClick(Sender: TObject);
    procedure bCancFuncClick(Sender: TObject);
    procedure vFuncSelect(Sender: TObject);
    procedure vDiasTrabChange(Sender: TObject);
    procedure vExtra75Change(Sender: TObject);
    procedure vExtra100Change(Sender: TObject);
    procedure bCadFolhaClick(Sender: TObject);
    procedure bCanFolhaClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Label31Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Label32Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Label29Click(Sender: TObject);
    procedure vExtra50Change(Sender: TObject);
  private
    { Private declarations }
  public
    function GeraNumeroMatricula: string;
    function GeraIDFolha: string;
    procedure IniciaConexaoBD;
    procedure IniciaCadFuncionario;
    procedure IniciaCadFolha;
    procedure AtualizaDataVigencia;
    procedure CadastraFuncionario;
    procedure CadastraFolhaPagamento;
    function TrataValores(valor: string): string;
    procedure PreencheListaFuncionarios;
    procedure BuscaDadosFuncionario(mat: string);
    function CalculaDiasTrabalhado(dias: string): string;
    function CalculaHorasExtra50(dias: string): string;
    function CalculaHorasExtra75(dias: string): string;
    function CalculaHorasExtra100(dias: string): string;
    function SomenteNumeros(const S: string): string;
    procedure CalculaBaseINSS;
    procedure CalculaDescontoINSS;
    procedure AtualizaListas;
    procedure CadastraFuncionariosTeste;
    procedure VerificaLoginBD;
  end;

var
  FPrincipal: TFPrincipal;
  vValorSalarioHoras: extended;

implementation

{$R *.dfm}

uses Dados;

// Inicia Conexão com Banco de Dados e Efetua a Criação das Tabelas Necessárias
procedure TFPrincipal.IniciaConexaoBD;
begin
  if Dados.FDados.ConfiguraConexao=true then
  begin
    // Cria Banco de Dados
    Dados.FDados.CriaBancodeDados;

    // Cria Tabelas para Uso no Sistema
    Dados.FDados.CriaTabelaFuncionario;
    Dados.FDados.CriaTabelaFolha_Pagamento;
  end
  else
    ShowMessage('Falha ao Conectar');
end;

procedure TFPrincipal.Label29Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=2;
  PagFPagamento.ActivePageIndex:=1;
end;

procedure TFPrincipal.Label30Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=1;
  PagFuncionario.ActivePageIndex:=0;
end;

procedure TFPrincipal.Label31Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=1;
  PagFuncionario.ActivePageIndex:=1;
end;

procedure TFPrincipal.Label32Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=2;
  PagFPagamento.ActivePageIndex:=0;
end;

// Verifica Valores em Tempo de Execução de Dias Trabalhados
procedure TFPrincipal.vDiasTrabChange(Sender: TObject);
begin
  if Length(vDiasTrab.Text)>0 then
  begin
    vDiasTrab.Text:=IntToStr(StrToInt(SomenteNumeros(vDiasTrab.Text)));
    vValorTrab.Text:=CalculaDiasTrabalhado(vDiasTrab.Text);

    CalculaBaseINSS;
  end;
end;

// Verifica Valores em Tempo de Execução de Horas Extras (100%)
procedure TFPrincipal.vExtra100Change(Sender: TObject);
begin
  if Length(vExtra100.Text)>0 then
  begin
    vValorExtra100.Text:=CalculaHorasExtra100(vExtra100.Text);

    CalculaBaseINSS;
  end;
end;

procedure TFPrincipal.vExtra50Change(Sender: TObject);
begin
  if Length(vExtra50.Text)>0 then
  begin
    vValorExtra50.Text:=CalculaHorasExtra50(vExtra50.Text);

    CalculaBaseINSS;
  end;
end;

// Verifica Valores em Tempo de Execução de Horas Extras (75%)
procedure TFPrincipal.vExtra75Change(Sender: TObject);
begin
  if Length(vExtra75.Text)>0 then
  begin
    vValorExtra75.Text:=CalculaHorasExtra75(vExtra75.Text);

    CalculaBaseINSS;
  end;
end;

// Calcula Porcentagem Base do Desconto do INSS
procedure TFPrincipal.CalculaBaseINSS;
var
  auxValor: Extended;
begin
  if length(vValorTrab.Text)=0 then vValorTrab.Text:='0';
  if length(vValorExtra50.Text)=0 then vValorExtra50.Text:='0';
  if length(vValorExtra75.Text)=0 then vValorExtra75.Text:='0';
  if length(vValorExtra100.Text)=0 then vValorExtra100.Text:='0';

  auxValor:=StrToFloat(StringReplace(vValorTrab.Text, '.', '',[rfReplaceAll]))+
            StrToFloat(StringReplace(vValorExtra75.Text, '.', '',[rfReplaceAll]))+
            StrToFloat(StringReplace(vValorExtra50.Text, '.', '',[rfReplaceAll]))+
            StrToFloat(StringReplace(vValorExtra100.Text, '.', '',[rfReplaceAll]));

  vBaseINSS.Text:='0';

  if auxValor>1500 then
    vBaseINSS.Text:='8';
  if auxValor>2000 then
    vBaseINSS.Text:='9';

  vValorSalarioHoras:=auxValor;

  CalculaDescontoINSS;
end;

// Calcula o Valor de Desconto do INSS
procedure TFPrincipal.CalculaDescontoINSS;
var
  auxCalc: Extended;
begin
  auxCalc:=(vValorSalarioHoras*StrToInt(vBaseINSS.Text))/100;

  vTotalProv.Text:=FormatFloat( '#,##0.00; (#,##0.00)',vValorSalarioHoras);
  vDescontoINSS.Text:=FormatFloat( '#,##0.00; (#,##0.00)',auxCalc);
  vDesconto.Text:=vDescontoINSS.Text;

  // Calcula Valor Líquido à Receber
  vTotal.Text:=FormatFloat( '#,##0.00; (#,##0.00)',vValorSalarioHoras-auxCalc);
end;

// Função para Permitir Somente Números
function TFPrincipal.SomenteNumeros(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;
    Inc(vText);
  end;
end;

// Calcula Dias Trabalhados
function TFPrincipal.CalculaDiasTrabalhado(dias: string): string;
var
  vCalc: Extended;
begin
  vCalc:=(StrToFloat(StringReplace(vSalarioFolha.Text, '.', '',[rfReplaceAll]))/30)*
          StrToInt(vDiasTrab.Text);
  result:=FormatFloat( '#,##0.00; (#,##0.00)',vCalc);
end;

// Calcula Horas Extras 50%
function TFPrincipal.CalculaHorasExtra50(dias: string): string;
var
  vCalc: Extended;
begin
  vCalc:=(StrToFloat(StringReplace(vSalarioFolha.Text, '.', '',[rfReplaceAll]))/220)*
         (StrToFloat(dias)*1.50);
  result:=FormatFloat( '#,##0.00; (#,##0.00)',vCalc);
end;

// Calcula Horas Extras 75%
function TFPrincipal.CalculaHorasExtra75(dias: string): string;
var
  vCalc: Extended;
begin
  vCalc:=(StrToFloat(StringReplace(vSalarioFolha.Text, '.', '',[rfReplaceAll]))/220)*
         (StrToFloat(dias)*1.75);
  result:=FormatFloat( '#,##0.00; (#,##0.00)',vCalc);
end;

// Calcula Horas Extras 100%
function TFPrincipal.CalculaHorasExtra100(dias: string): string;
var
  vCalc: Extended;
begin
  vCalc:=(StrToFloat(StringReplace(vSalarioFolha.Text, '.', '',[rfReplaceAll]))/220)*
         (StrToFloat(dias)*2);
  result:=FormatFloat( '#,##0.00; (#,##0.00)',vCalc);
end;

// Seleciona Funcionario no Combobox
procedure TFPrincipal.vFuncSelect(Sender: TObject);
begin
  if vFunc.Items.Count>0 then
  begin
    // Utiliza os 3 primeiros caracteres para usar como ID
    BuscaDadosFuncionario(LeftStr(vFunc.Text,3));

    vDiasTrab.SetFocus;
  end;
end;

// Busca Dados do Funcionario Selecionado no Combobox
procedure TFPrincipal.BuscaDadosFuncionario(mat: string);
begin
  with Dados.FDados do
  begin
    QryAux.Close;
    QryAux.SQL.Text:=' select * from funcionarios where matricula='+mat;
    QryAux.Open;

    vSalarioFolha.Text:=FormatFloat( '#,##0.00; (#,##0.00)',
                        QryAux.FieldByName('salario').AsExtended);
    vHoraMesFolha.Text:=FormatFloat( '#,##0.00; (#,##0.00)',
                        QryAux.FieldByName('hora_mes').AsExtended);
    vCPFFolha.Text:=QryAux.FieldByName('cpf').AsString;
    vNISFolha.Text:=QryAux.FieldByName('nis').AsString;
  end;
end;

procedure TFPrincipal.vNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFPrincipal.vSalarioKeyPress(Sender: TObject; var Key: Char);
var
   Texto, Texto2: string;
   i: byte;
begin
  // Enter Passa para o Próximo Campo
  if (Key = #13) then
  begin
    Perform(Wm_NextDlgCtl,0,0);
  end;

  // Formata Valor Númerico
  if (Key in ['0'..'9',chr(vk_back)]) then
  begin
     if (key in ['0'..'9']) and (Length(Trim(TEdit(Sender).Text))>23) then
        key := #0;

     Texto2 := '0';
     Texto := Trim(TEdit(Sender).Text)+Key;
     for i := 1 to Length(Texto) do
        if Texto[i] in ['0'..'9'] then
           Texto2 := Texto2 + Texto[i];

     // Caso seja pressionado BACKSPACE (única tecla válida, fora os números)
     if key = chr(vk_back) then
        Delete(Texto2,Length(Texto2),1);

     Texto2 := FormatFloat('#,0.00',StrToInt64(Texto2)/100);

     repeat
        Texto2 := ' '+Texto2
     until Canvas.TextWidth(Texto2) >= TEdit(Sender).Width;

     TEdit(Sender).Text := Texto2;
     TEdit(Sender).SelStart := Length(Texto2);
  end;

  Key := #0;
end;

// Gera Número de Matrícula de Funcionario
function TFPrincipal.GeraNumeroMatricula: string;
var
  auxMat: integer;
  auxMatStr: string;
begin
  with Dados.FDados do
  begin
    QryAux.Close;
    QryAux.SQL.Text:=' select max(matricula) as mat from funcionarios';
    QryAux.Open;

    // Formata valor de resposta em String
    auxMat:=QryAux.FieldByName('mat').AsInteger+1;
    auxMatStr:=IntToStr(auxMat);
    auxMatStr:=StringOfChar('0',3-Length(auxMatStr))+auxMatStr;

    result:=auxMatStr;
  end;
end;

// Gera Número de ID da Folha de Pagamento
function TFPrincipal.GeraIDFolha: string;
var
  auxID: integer;
  auxIDStr: string;
begin
  with Dados.FDados do
  begin
    QryAux.Close;
    QryAux.SQL.Text:=' select (max(id)) as vid from folha_pagamento';
    QryAux.Open;

    // Formata valor de resposta em String
    auxID:=QryAux.FieldByName('vid').AsInteger+1;
    auxIDStr:=IntToStr(auxID);
    auxIDStr:=StringOfChar('0',3-Length(auxIDStr))+auxIDStr;

    result:=auxIDStr;
  end;
end;

// Preenche Combobox com lista de Funcionarios Cadastrados
procedure TFPrincipal.PreencheListaFuncionarios;
var
  auxFunc: string;
begin
  vFunc.Clear;

  with Dados.FDados do
  begin
    QryAux.Close;
    QryAux.SQL.Text:=' select * from funcionarios';
    QryAux.Open;

    QryAux.First;
    while not QryAux.Eof do
    begin
      auxFunc:=StringOfChar('0',3-Length(
                             QryAux.FieldByName('matricula').AsString))+
                             QryAux.FieldByName('matricula').AsString+' - '+
                             QryAux.FieldByName('nome').AsString;
      vFunc.Items.Add(auxFunc);
      QryAux.Next;
    end;
  end;
end;

procedure TFPrincipal.bCancFuncClick(Sender: TObject);
begin
  IniciaCadFuncionario;
  vNome.SetFocus;
end;

procedure TFPrincipal.bCadFuncClick(Sender: TObject);
begin
  CadastraFuncionario;
end;

procedure TFPrincipal.bCanFolhaClick(Sender: TObject);
begin
  IniciaCadFolha;
end;

procedure TFPrincipal.bCadFolhaClick(Sender: TObject);
begin
  if vFunc.ItemIndex>-1 then
  begin
    CadastraFolhaPagamento;
    IniciaCadFolha;
    vFunc.SetFocus;
  end
  else
    ShowMessage('Você deve selecionar um Funcionário Antes!');
end;

// Atualiza Data de Vigencia
procedure TFPrincipal.AtualizaDataVigencia;
begin
  vMes.ItemIndex:=MonthOf(date)-1;
  vAno.Text:=IntTOStr(YearOf(date));
end;

// Cadastro Funcionário
procedure TFPrincipal.CadastraFuncionario;
var
  auxMat: integer;
begin
  auxMat:=StrToInt(vMatricula.Caption);

  with Dados.FDados do
  begin
    try
      QryAux.Close;
      QryAux.SQL.Text:=' insert into funcionarios ('+
                       ' matricula,'+
                       ' nome,'+
                       ' salario,'+
                       ' hora_mes,'+
                       ' cpf,'+
                       ' nis,'+
                       ' tipo_folha) values ('+
                       IntTOStr(auxMat)+', '+
                       QuotedStr(vNome.Text)+', '+
                       TrataValores(vSalario.Text)+', '+
                       TrataValores(vHoraMes.Text)+', '+
                       QuotedStr(vCPF.Text)+', '+
                       QuotedStr(vNIS.Text)+', '+
                       QuotedStr(vTipoFolha.Text)+')';
      QryAux.ExecSQL;
    finally
      ShowMessage('Funcionário Cadastrado com Êxito!');

      AtualizaListas;
      PreencheListaFuncionarios;
      IniciaCadFuncionario;
      vNome.SetFocus;
    end;
  end;
end;

// Cadastro Folha de Pagamento
procedure TFPrincipal.CadastraFolhaPagamento;
begin
  with Dados.FDados do
  begin
    try
      QryAux.Close;
      QryAux.SQL.Text:=' insert into folha_pagamento ('+
                       ' 	id,'+
                       ' 	matricula,'+
                       ' 	dias_trabalhado,'+
                       ' 	valor_dias_trabalhado,'+
                       ' 	horas_extra_50,'+
                       ' 	valor_horas_extra_50,'+
                       ' 	horas_extra_75,'+
                       ' 	valor_horas_extra_75,'+
                       ' 	horas_extra_100,'+
                       ' 	valor_horas_extra_100,'+
                       ' 	desconto_inss_padrao,'+
                       ' 	desconto_inss,'+
                       ' 	vigencia,'+
                       ' 	total_proventos,'+
                       ' 	total_descontos,'+
                       ' 	total_receber) values ('+
                       vID.Caption+', '+
                       LeftStr(vFunc.Text,3)+', '+
                       TrataValores(vDiasTrab.Text)+', '+
                       TrataValores(vValorTrab.Text)+', '+
                       TrataValores(vExtra50.Text)+', '+
                       TrataValores(vValorExtra50.Text)+', '+
                       TrataValores(vExtra75.Text)+', '+
                       TrataValores(vValorExtra75.Text)+', '+
                       TrataValores(vExtra100.Text)+', '+
                       TrataValores(vValorExtra100.Text)+', '+
                       vBaseINSS.Text+', '+
                       TrataValores(vDescontoINSS.Text)+', '+
                       QuotedStr(vMes.Text+'/'+vAno.Text)+', '+
                       TrataValores(vTotalProv.Text)+', '+
                       TrataValores(vDesconto.Text)+', '+
                       TrataValores(vTotal.Text)+')';
      QryAux.ExecSQL;
    finally
      ShowMessage('Folha de Pagamento Cadastrado com Êxito!');

      AtualizaListas;
      PreencheListaFuncionarios;
      IniciaCadFuncionario;
    end;
  end;
end;

// Trata Valores Numéricos para Cadastro nas Tabelas
function TFPrincipal.TrataValores(valor: string): string;
var
  auxValor: string;
begin
  auxValor:=StringReplace(valor, '.', '',[rfReplaceAll]);
  auxValor:=StringReplace(auxValor, ',', '.',[rfReplaceAll]);

  result:=auxValor;
end;

// Inicia Edits para Iniciar Cadastro de Funcionario
procedure TFPrincipal.IniciaCadFuncionario;
begin
  // Gera Nº da Matrícula
  vMatricula.Caption:=GeraNumeroMatricula;

  // Zera Edits
  vNome.Clear;
  vSalario.Text:='0';
  vHoraMes.Text:='200,00';    //Valor Padrão
  vCPF.Clear;
  vNIS.Clear;
  vTipoFolha.Text:='MENSAL';  //Valor Padrão
end;

// Inicia Edits para Iniciar Cadastro de Folha de Pagamento
procedure TFPrincipal.Image3Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=2;
  PagFPagamento.ActivePageIndex:=1;
end;

procedure TFPrincipal.Image4Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=1;
  PagFuncionario.ActivePageIndex:=0;
end;

procedure TFPrincipal.Image5Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=1;
  PagFuncionario.ActivePageIndex:=1;
end;

procedure TFPrincipal.Image6Click(Sender: TObject);
begin
  PagPrincipal.ActivePageIndex:=2;
  PagFPagamento.ActivePageIndex:=0;
end;

procedure TFPrincipal.IniciaCadFolha;
begin
  // Gera ID da Folha
  vID.Caption:=GeraIDFolha;

  // Preenche Lista de Funcionarios
  PreencheListaFuncionarios;

  // Atualiza Data de Vigencia
  AtualizaDataVigencia;

  // Zera Edits
  vSalarioFolha.Text:='0';
  vHoraMesFolha.Text:='0';
  vCPFFolha.Text:='0';
  vNISFolha.Text:='0';
  vDiasTrab.Text:='0';
  vValorTrab.Text:='0';
  vExtra50.Text:='0';
  vValorExtra50.Text:='0';
  vExtra75.Text:='0';
  vValorExtra75.Text:='0';
  vExtra100.Text:='0';
  vValorExtra100.Text:='0';
  vBaseINSS.Text:='0';
  vDescontoINSS.Text:='0';
  vDesconto.Text:='0';
  vTotal.Text:='0';
  vTotalProv.Text:='0';
end;

// Ajusta Panel´s Usados de Formulario
procedure TFPrincipal.FormResize(Sender: TObject);
begin
  PCadFunc.Top:=trunc(PagFuncionario.Height/2)-trunc(PCadFunc.Height/2);
  PCadFunc.Left:=trunc(PagFuncionario.Width/2)-trunc(PCadFunc.Width/2);

  PCadFolha.Top:=trunc(PagFPagamento.Height/2)-trunc(PCadFolha.Height/2);
  PCadFolha.Left:=trunc(PagFPagamento.Width/2)-trunc(PCadFolha.Width/2);
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  // Inicio Conexão com Banco de Dados
  VerificaLoginBD;
  IniciaConexaoBD;

  // Cadastra Funcionarios Testes
  CadastraFuncionariosTeste;

  // Inicia Informações para Cadastro de Funcionario
  IniciaCadFuncionario;
  IniciaCadFolha;
  AtualizaListas;

  PagPrincipal.ActivePageIndex:=0;
  PagFuncionario.ActivePageIndex:=0;
  PagFPagamento.ActivePageIndex:=0;
end;

// Atualiza Lista dos DBgrid Demonstrativos
procedure TFPrincipal.VerificaLoginBD;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'BD.ini') then
  begin
    GerBanco.FGerBanco.DadosLogin.Clear;
    GerBanco.FGerBanco.DadosLogin.Items.
             LoadFromFile(ExtractFilePath(Application.ExeName)+'BD.ini');
  end
  else
  begin
    GerBanco.FGerBanco.DadosLogin.Clear;
    GerBanco.FGerBanco.DadosLogin.Items.Add('postgres');
    GerBanco.FGerBanco.DadosLogin.Items.Add(' ');
    GerBanco.FGerBanco.DadosLogin.Items.
             SaveToFile(ExtractFilePath(Application.ExeName)+'BD.ini');
  end;
end;

// Atualiza Lista dos DBgrid Demonstrativos
procedure TFPrincipal.AtualizaListas;
begin
  with Dados.FDados do
  begin
    QryFuncionarios.Close;
    QryFuncionarios.SQL.Text:='select * from funcionarios';
    QryFuncionarios.Open;

    QryFolha.Close;
    QryFolha.SQL.Text:='select * from folha_pagamento';
    QryFolha.Open;
  end;
end;

// Cadastra Funcionarios Testes
procedure TFPrincipal.CadastraFuncionariosTeste;
var
  sqlbase, sql1, sql2, sql3, sqle: string;
  i: integer;
begin
  sqlbase:=' insert into funcionarios ('+
           ' matricula,'+
           ' nome,'+
           ' salario,'+
           ' hora_mes,'+
           ' cpf,'+
           ' nis,'+
           ' tipo_folha) values (';

  sql1:='1, '+
        QuotedStr('JEFERSON GOMES')+', '+
        '1350, '+
        '220, '+
        QuotedStr('22222222222')+', '+
        QuotedStr('333333333333')+', '+
        QuotedStr('MENSAL')+')';

  sql2:='2, '+
        QuotedStr('CARLA NEVES')+', '+
        '1800, '+
        '220, '+
        QuotedStr('11111111111')+', '+
        QuotedStr('222222222222')+', '+
        QuotedStr('MENSAL')+')';

  sql3:='3, '+
        QuotedStr('ANDRÉ DOS SANTOS')+', '+
        '2500, '+
        '220, '+
        QuotedStr('55473655050')+', '+
        QuotedStr('12067322488')+', '+
        QuotedStr('MENSAL')+')';

  with Dados.FDados do
  begin
    QryFuncionarios.Close;
    QryFuncionarios.SQL.Text:='select * from funcionarios';
    QryFuncionarios.Open;

    if QryFuncionarios.RecordCount=0 then
    begin
      for i:=0 to 2 do
      begin
        if i=0 then sqle:=sql1;
        if i=1 then sqle:=sql2;
        if i=2 then sqle:=sql3;

        QryAux.Close;
        QryAux.SQL.Text:=sqlbase+sqle;
        QryAux.ExecSQL;
      end;
    end;
  end;
end;

end.
