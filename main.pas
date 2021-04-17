unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Clipbrd,
  StdCtrls, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    ClearButton: TButton;
    CloppyTimer: TTimer;
    ClipListBox: TListBox;
    GitHubLabel: TLabel;
    Label1: TLabel;
    procedure ClearButtonClick(Sender: TObject);
    procedure ClipListBoxDblClick(Sender: TObject);
    procedure CloppyTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GitHubLabelClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  currClip: String;

implementation

{$R *.lfm}

{ TForm1 }

// Monitor clipboard for changes
procedure TForm1.CloppyTimerTimer(Sender: TObject);
var
  tmpClip, tmp: String;
  boxContains: Boolean;
begin
  boxContains:=false;

  tmpClip := Clipboard.AsText;

  if tmpClip <> currClip then begin
    for tmp in ClipListBox.Items do begin
      if tmpClip = tmp then begin boxContains := true; break; end;
    end;
    if boxContains = false then begin
      ClipListBox.Items.Add(tmpClip);
      currClip := tmpClip;
    end;
  end;
end;

procedure TForm1.ClipListBoxDblClick(Sender: TObject);
begin
  Clipboard.AsText := ClipListBox.GetSelectedText;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
  ClipListBox.Items.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  currClip := Clipboard.AsText;
end;

procedure TForm1.GitHubLabelClick(Sender: TObject);
begin
  OpenUrl('https://xn--90abhbolvbbfgb9aje4m.xn--p1ai/');
end;

end.

