unit PanelTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, DialogButtons, mvResourceFile;

type
  TForm2 = class(TForm)
    btn2: TButton;
    rsrcfl1: TResourceFile;
    rsrcfl2: TResourceFile;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btn2Click(Sender: TObject);
begin
  btn1.Visible := false;
  ShowMessage('Value from component: '+btn1.GetDoVerb);
end;

end.
