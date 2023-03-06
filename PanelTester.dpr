program PanelTester;

uses
  System.StartUpCopy,
  FMX.Forms,
  PanelTest in 'PanelTest.pas' {Form2},
  PanelDesign in 'PanelDesign.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
