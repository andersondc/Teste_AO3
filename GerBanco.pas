unit GerBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFGerBanco = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    vLogin: TEdit;
    Label2: TLabel;
    vSenha: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DadosLogin: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGerBanco: TFGerBanco;

implementation

{$R *.dfm}

procedure TFGerBanco.Button1Click(Sender: TObject);
begin
  DadosLogin.Clear;
  DadosLogin.Items.Add(vLogin.Text);
  DadosLogin.Items.Add(vSenha.Text);
  DadosLogin.Items.SaveToFile(ExtractFilePath(Application.ExeName)+'BD.ini');
  close;
end;

procedure TFGerBanco.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
