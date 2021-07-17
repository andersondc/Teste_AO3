program CriarBanco;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FPrincipal},
  Dados in 'Dados.pas' {FDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFDados, FDados);
  Application.Run;
end.
