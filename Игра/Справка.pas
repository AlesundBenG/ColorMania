unit Справка;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Path:string;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
Path:=ExtractFileDir(Application.ExeName);
Form2.memo1.clear;
Form2.memo1.lines.LoadFromFile(path+'\Справка.txt');
end;

end.
