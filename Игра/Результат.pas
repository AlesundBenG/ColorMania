unit ���������;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RecordResult: TMemo;
    RecordLongWay: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Score: TLabel;
    LongWay: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    FinishGame: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Path:String;

implementation

{$R *.dfm}

Uses ����;


procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Enabled:=true;
Form3.Label1.Visible:=true;
Form3.Label2.Visible:=true;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
Path:=ExtractFileDir(Application.ExeName);
RecordResult.Clear;
RecordLongWay.Clear;
FinishGame.lines.LoadFromFile(path+'\������������.txt');
RecordResult.Lines.LoadFromFile(path+'\�������.txt');
RecordlongWay.Lines.LoadFromFile(path+'\�������������������.txt');
end;

end.
