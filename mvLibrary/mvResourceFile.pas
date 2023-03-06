unit mvResourceFile;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.StdCtrls, System.UITypes;

type
  TResourceFile = class(TPanel)
  private
    FDoVerb: string;
  protected
    function GetStyleObject: TFmxObject; override;
    procedure ApplyStyle; override;
  public
    function GetDoVerb: string;
    procedure SetDoVerb(AString: string);
    constructor Create(AOwner: TComponent); override;
  published
    property DoVerb: string read GetDoVerb write SetDoVerb;
    property Align default TAlignLayout.None;
  end;

const
  DoButtonName = 'DoButton';
  DontButtonName = 'DontButton';
  CancelButtonName = 'CancelButton';
  mrDont = -mrOK;

procedure Register;

implementation

uses System.Types, FMX.Styles;

{$R *.res}

function TResourceFile.GetStyleObject: TFmxObject;
const
  Style = 'RESFilePane';
begin
  if (StyleLookup = '') then
  begin
    Result := TFmxObject(TStyleStreaming.LoadFromResource(HInstance, Style,
      RT_RCDATA));
    Exit;
  end;
  Result := inherited GetStyleObject;
end;

constructor TResourceFile.Create(AOwner: TComponent);
begin
  inherited;
  Height := 32;
  Width := 32;
  Align := TAlignLayout.None;
  DoVerb := 'Verb';
end;

function TResourceFile.GetDoVerb: string;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(DoButtonName);
  if Base is TTextControl then
    FDoVerb := TTextControl(Base).Text;
  Result := FDoVerb;
end;

procedure TResourceFile.SetDoVerb(AString: string);
var
  Base: TFmxObject;
resourcestring
  Dont = 'Don'#39't %s';
begin
  FDoVerb := AString;
  Base := FindStyleResource(DoButtonName);
  if Base is TTextControl then
    TTextControl(Base).Text := AString;
  Base := FindStyleResource(DontButtonName);
  if Base is TTextControl then
    TTextControl(Base).Text := Format(Dont, [AString]);
end;

procedure TResourceFile.ApplyStyle;
begin
  inherited;
  SetDoVerb(FDoVerb);
end;

procedure Register;
begin
  RegisterComponents('Data Objects', [TResourceFile]);
end;

end.
