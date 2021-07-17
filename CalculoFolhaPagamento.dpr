program CalculoFolhaPagamento;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FPrincipal},
  Dados in 'Dados.pas' {FDados: TDataModule},
  GerBanco in 'GerBanco.pas' {FGerBanco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFDados, FDados);
  Application.CreateForm(TFGerBanco, FGerBanco);
  Application.Run;
end.
