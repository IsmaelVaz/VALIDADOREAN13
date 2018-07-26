program valCodBarras;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  ABOUT in 'ABOUT.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
