unit �����������;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Path:string;


implementation

{$R *.dfm}

uses ����,���������;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TablRecord(Memo:Tmemo; Edit1:TEdit;NumberString:integer; Way:string);
var i,j,Number: integer; s:string;
begin
i:=0;

Memo.Lines.insert(NumberString,'0. '+Edit1.text+' ����: '+Form3.Score.Caption+' �������: '+Form3.LongWay.Caption);   //��������� ������ � ����� �������.

for j := 0 to Memo.lines.Count-1 do begin
s:=Memo.Lines[j];
While copy(s,1,1)<>'.' do begin  delete(s,1,1); end;       //������� ���������� ����� ������.
insert(inttostr(j+1),s,0);
Memo.Lines.delete(j);
Memo.Lines.insert(j,s);

end;  //����� ����� for

if (way<>'\������������.txt') and (Memo.Lines.Count-1>14) then begin memo.Lines.Delete(Memo.Lines.Count-1); end;




Path:=ExtractFileDir(Application.ExeName);
Memo.lines.SavetoFile(path+Way);     //��������� ���������.
Memo.lines.LoadFromFile(path+Way);   //��������� ���������� ����������.

end;



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm4.Button1Click(Sender: TObject);  //��������� ��� ������ � ������� ��������.
var i,b,NumberString,Number: Integer; LastPosition:string;
begin

if masrecord[1]<>-1 then begin TablRecord(Form3.FinishGame,Edit1,Form3.FinishGame.Lines.Count,'\������������.txt'); end;
if masrecord[2]<>-1 then begin TablRecord(Form3.RecordResult,Edit1,masrecord[2],'\�������.txt'); end;
if masrecord[3]<>-1 then begin TablRecord(Form3.RecordLongWay,Edit1,masrecord[3],'\�������������������.txt');   end;

Form1.Enabled:=true;
Form3.Enabled:=true;
Form4.Close;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm4.Edit1Change(Sender: TObject);             //����������� �� ���� ����� (20 ��������)
var s:string;
begin
if length(Edit1.text)>20  then begin
s:=copy(Edit1.Text,0,20);
Edit1.text:=s;
Edit1.SelStart:=20;
Edit1.SelLength:=0
end;
if length(Edit1.text)=0 then begin button1.Enabled:=false; end else begin
  button1.Enabled:=true;
end;
if copy(Edit1.Text,length(Edit1.text),1)=':' then begin
s:= copy(Edit1.Text,0,length(Edit1.text)-1);
Edit1.text:=s;
Edit1.SelStart:=length(Edit1.text);
Edit1.SelLength:=0
end;


end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm4.FormCreate(Sender: TObject);
begin
Edit1.text:='Player';

end;

end.
