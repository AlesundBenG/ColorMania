unit ����;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus;

  type
  mas=array [0..25,0..25] of integer;
  mas1=array[1..3] of integer;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    history1: TLabel;
    history2: TLabel;
    history3: TLabel;
    history4: TLabel;
    history5: TLabel;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pole: mas;
  masrecord:mas1;
  color,oldcolor:Tcolor;
  Image1: Timage;
  Point: integer;
  X,Y,NumberClearX,Score,MaxLongWay: integer;
  Path:string;
  Win:boolean;

implementation

{$R *.dfm}

Uses �������, ���������, �����������;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function RecordScore(Score: integer; var MasRecord:mas1):boolean;
var i,j,j1,long,NumberStringRecord: integer;  b:boolean;
begin
Path:=ExtractFileDir(Application.ExeName);
Form3.RecordResult.clear;
Form3.RecordResult.Lines.LoadFromFile(path+'\�������.txt');
b:=false;
NumberStringRecord:=0;
 if Form3.RecordResult.Lines.count<>0 then begin
 i:=Form3.RecordResult.Lines.count;
 while i<>0  do begin
 j:=0;
   while copy(Form3.RecordResult.Lines[i-1],j,1)<>':' do begin j:=j+1; end; //���� ������.
   j:=j+2;//������.
   j1:=j;
   while copy(Form3.RecordResult.Lines[i-1],j1,1)<>' ' do begin j1:=j1+1; end;   //���� �����.
   //j1:=j1-1;//�����.
   long:=j1-j;
   if Score>strtoint(copy(Form3.RecordResult.Lines[i-1],j,long)) then begin b:=true; RecordScore:=true; NumberStringRecord:=i-1 end;
  i:=i-1;
  end; //����� ����� while
  end else begin RecordScore:=true; b:=true; end;


if b=true then begin
   masRecord[2]:= NumberStringRecord;
end else begin RecordScore:=false end;

end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function RecordWay(MaxLongWay:integer;var MasRecord: mas1):boolean;
var i,k,j,j1,long,NumberStringRecord: integer;  b:boolean;
begin
Path:=ExtractFileDir(Application.ExeName);
Form3.RecordlongWay.clear;
Form3.RecordlongWay.Lines.LoadFromFile(path+'\�������������������.txt');
k:=1;
b:=false;
NumberStringRecord:=0;
 if Form3.RecordlongWay.Lines.count<>0 then begin
 i:=Form3.RecordlongWay.Lines.count;
 while  i<>0  do begin
 j:=length(Form3.RecordlongWay.Lines[i-1]);
   while copy(Form3.RecordlongWay.Lines[i-1],j,1)<>':' do begin  j:=j-1; end; //���� ������.
   j:=j+1;//������.
   long:=length(Form3.RecordlongWay.Lines[i-1])-j+1;
   if MaxLongWay>strtoint(copy(Form3.RecordlongWay.Lines[i-1],j,long)) then begin b:=true; RecordWay:=true; NumberStringRecord:=i-1 end;
  i:=i-1;
  end; //����� ����� while
  end else begin RecordWay:=true; b:=true; end;

if b=true then begin
   masRecord[3]:= NumberStringRecord;
end else begin RecordWay:=false end;

end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure ShowResult(Score,MaxLongWay: integer;Win:boolean; var masrecord: mas1);
var color:Tcolor; Finish: string; b:boolean;
begin
b:=false;

sleep(1000);

if Win=true then  //���� ��������� ������� ����.
 begin
  color:=clYellow;
  Finish:='����������, �� ��������!(+5000 �� ������)';
  Score:=Score+5000;
  masrecord[1]:=1;
  end else
    begin
    color:=clRed;
    Finish:='����� ����.';
    end;


if b=false then  //���� �� ������, �� ����� � ������� �������� ������ 10, �� ��������� ������.
  begin
     if Form3.RecordResult.Lines.count-1<14 then begin  masrecord[2]:= Form3.RecordResult.Lines.count; b:=true; end;
     if Form3.RecordlongWay.Lines.count-1<14 then begin  masrecord[3]:= Form3.RecordlongWay.Lines.count; b:=true; end;
  end;

if win=true then begin b:=true; end;                           //���� �������.
if RecordScore(Score,masrecord)=true then begin b:=true; end;   //���� ������ �� �����
if RecordWay(MaxLongWay,masrecord)=true  then begin b:=true; end;  //���� ������ �� ����� �������.

Form3.label7.Font.color:=color;
Form3.label7.Caption:=Finish;
Form3.Score.Caption:=inttostr(Score);
Form3.LongWay.Caption:= inttostr(MaxLongWay);
Form3.Show;

if b=true then begin
  Form1.Enabled:=false;
  Form3.Enabled:=false;
  Form4.Show;
end;

end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure Result(NumberDeleteRectangle,Score,Score1: integer; history1,history2,history3,history4,history5,label2,label4: TLabel);
var color:Tcolor;
begin
   label2.caption:= inttostr(Score);   //������� �� ����� ����.
   label4.Caption:=('+'+inttostr(Score-Score1-NumberDeleteRectangle)); //������� �� ����� ������.

  history5.Font.color:=history4.Font.color;
  history5.caption:=history4.caption;
  history4.Font.color:=history3.Font.color;
  history4.caption:=history3.caption;
  history3.Font.color:=history2.Font.color;
  history3.caption:=history2.caption;
  history2.Font.color:=history1.Font.color;
  history2.caption:=history1.caption;
  history1.caption:=inttostr(NumberDeleteRectangle)+' ��������(��)';


  if NumberDeleteRectangle<5                                    then begin color:=$FF0601; end;
  if (NumberDeleteRectangle>=5)  and (NumberDeleteRectangle<10) then begin color:=$FFEF00; end;
  if (NumberDeleteRectangle>=10) and (NumberDeleteRectangle<20) then begin color:=$27FF03; end;
  if (NumberDeleteRectangle>=20) and (NumberDeleteRectangle<30) then begin color:=$1500FF; end;
  if (NumberDeleteRectangle>=30)                                then begin color:=$00FAFF; end;

  history1.Font.Color:=color;
  label4.Font.Color:=color;

end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function GameOver(pole: mas; var Win:boolean): boolean;
var i,j,Colorplace: Integer; b:boolean; Clear:boolean;
begin
  b:=false;
  Clear:=true; //����������, �������� �� ����.
for i := 15 to 20 do begin
 for j := 15 to 20 do begin
  Colorplace:=pole[i,j];
  if Colorplace<>0 then begin
  Clear:=false;
  if Colorplace=pole[i,j+1] then begin GameOver:=true; b:=true; break;  end;
  if Colorplace=pole[i,j-1] then begin GameOver:=true; b:=true; break;  end;
  if Colorplace=pole[i+1,j] then begin GameOver:=true; b:=true; break;  end;
  if Colorplace=pole[i-1,j] then begin GameOver:=true; b:=true; break;  end;
  end;
  end; //����� ����� j
  if b=true then  begin break; end;

end; //����� ����� i

if b=false then begin GameOver:=false; if clear=true then Win:=true; end;

end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure DrawRectangle (i,j: integer; color:TColor; Image1: Timage);          //i - ��� y; j - ��� x
var color2: Tcolor;
begin

if color=clWhite then begin color2:= clWhite; end    //�����������, ����� �� �������.
else begin color2:=$361D09; end;

Image1.Canvas.Pen.Color:=color2;      //���� �������.
Image1.Canvas.Brush.Color:= color;    //���� ��������.
Image1.canvas.Rectangle(30*j,30*i,30*(j+1),30*(i+1));
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function CheckPlace(X,Y:integer; ColorPlace:integer; var pole: mas; var Score,bonus,NumberDeleteRectangle: integer): boolean;
var ColorPlaceAround: integer;
begin

if ((X<>0) and (Y<>0))or((X<>21) and (Y<>21)) then   //�������� �� ������ ������� �������� ���� �� �����.
begin
ColorPlaceAround:= pole[Y,X+1];
if (ColorPlaceAround=ColorPlace) then begin Score:=Score+1+bonus; NumberDeleteRectangle:=NumberDeleteRectangle+1; bonus:=bonus+1; pole[Y,X+1]:=0; CheckPlace(X+1,Y,ColorPlace,pole,Score,bonus,NumberDeleteRectangle); CheckPlace:=true; end;
ColorPlaceAround:= pole[Y,X-1];
if (ColorPlaceAround=ColorPlace) then begin Score:=Score+1+bonus; NumberDeleteRectangle:=NumberDeleteRectangle+1; bonus:=bonus+1; pole[Y,X-1]:=0; CheckPlace(X-1,Y,ColorPlace,pole,Score,bonus,NumberDeleteRectangle); CheckPlace:=true; end;
ColorPlaceAround:= pole[Y+1,X];
if (ColorPlaceAround=ColorPlace) then begin Score:=Score+1+bonus; NumberDeleteRectangle:=NumberDeleteRectangle+1; bonus:=bonus+1; pole[Y+1,X]:=0; CheckPlace(X,Y+1,ColorPlace,pole,Score,bonus,NumberDeleteRectangle); CheckPlace:=true; end;
ColorPlaceAround:= pole[Y-1,X];
if (ColorPlaceAround=ColorPlace) then begin Score:=Score+1+bonus; NumberDeleteRectangle:=NumberDeleteRectangle+1; bonus:=bonus+1; pole[Y-1,X]:=0; CheckPlace(X,Y-1,ColorPlace,pole,Score,bonus,NumberDeleteRectangle); CheckPlace:=true; end;
end;

end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function SetOldColor(k: integer):Tcolor;
begin
 case k of
0: begin SetOldColor:=clWhite;  end;
1: begin SetOldColor:=$3D19DD;  end;
2: begin SetOldColor:=$824210;  end;
3: begin SetOldColor:=$757A75;  end;
end;
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure MoveMassiveRight(a,NumberClearX :integer; Image1: Timage; var pole: mas);
var i,j: integer;
begin
if a<>0 then begin
for i := a downto 1 do begin
  for j := 0 to 20 do begin
    pole[j,i]:=pole[j,i-1];
  end; //����� ����� j
end; //����� ����� i
end;

for j := 0 to 20 do begin
    pole[j,NumberClearX]:=0;
    color:=clWhite;
    DrawRectangle (j,0,NumberClearX,Image1);
end;
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure MoveMassive(a,b:integer; color:TColor; var oldcolor:TColor; Image1: Timage; var pole: mas);
var i,k,j: integer;
begin
  for i := a downto 1 do begin
    pole[i,b]:=pole[i-1,b];
    color:=SetOldColor(pole[i,b]);
    DrawRectangle (i,b,color,Image1);
    end; //����� �����
    pole[0,b]:=0;
    DrawRectangle (0,b,clWhite,Image1);
end;




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure DeleteRectangle (X,Y:integer; var NumberClearX,MaxLongWay : integer; color:TColor; var oldcolor:TColor; Image1: Timage; var pole: mas; var masRecord: mas1; var Score: integer; var Win: boolean; Label2,Label4,history1,history2,history3,history4,history5: TLabel);
var ColorPlace:integer; i,j,k,Score1,bonus: integer; b: boolean; NumberDeleteRectangle: integer;
begin
Score1:=Score;
NumberDeleteRectangle:=0; //���������� ��������� ���������
bonus:=0; //������
b:=false; //����� �� �������� ������(������ ���������� ����� ���������� ������ �����)
ColorPlace:=pole[Y,X]; //�������� ���� ���� �� ������� �����.
if CheckPlace(X,Y,ColorPlace,pole,Score,bonus,NumberDeleteRectangle)=true then //���� ����� ��������� ���� ���� ����� � ����� �� ������.
begin
pole[Y,X]:=0;
for I := 0 to 20 do begin            //�������� ������, �������� ���� ��������� �������.
 for j := 0 to 20 do begin
   if pole[i,j]=0 then begin
     MoveMassive(i,j,color,oldcolor,Image1,pole);
     end; //����� if
   end; //����� ����� j
 end; //����� ����� i

    for i := 20 downto NumberClearX do begin     //��������, ����� �� �������� ������.
      if pole[20,i]=0 then begin b:=true; break; end; //���� �� ��������� ������� ���� ������ ����� (0), ��...
    end;

    if b=true then begin                      //..�������� ������.
    i:=20;
    while i<>NumberClearX do  begin
      if pole[20,i]=0 then begin
        MoveMassiveRight(i,NumberClearX,Image1,pole); //����� ������.
         for j := 0 to 20 do begin
         for k := 0 to i do begin
          color:=SetOldColor(pole[j,k]);
          DrawRectangle (j,k,color,Image1);
         end; //����� ����� k
        end; //����� ����� j
        NumberClearX:=NumberClearX+1;
        i:=i+1;
      end; //����� �������
      i:=i-1;
    end; //����� ����� i
  end;

  if NumberDeleteRectangle>MaxLongWay then begin MaxLongWay:=NumberDeleteRectangle end;  //������������ ����� �������.
  oldcolor:= SetOldColor(pole[Y,X]);  //����, �� ������� ��������� ���������.
  Result(NumberDeleteRectangle,Score,Score1,history1,history2,history3,history4,history5,label2,label4); //��������� ����.

  if Gameover(pole,Win)=false then begin ShowResult(Score,MaxLongWay,Win,masRecord); end;  //����� ����.

end; //����� if (1)



end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure Place (color:Tcolor; Image1: Timage; Point: integer; X,Y: integer);
begin
color:=$36D409;
Image1.Canvas.Pen.Color := color;
Image1.Canvas.Brush.Color:= oldcolor;
Image1.canvas.Rectangle(30*X,30*Y,30*(X+1),30*(Y+1));
end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

case Key of
 VK_UP:     begin
            if Y<>0 then begin
            DrawRectangle (Y,X,oldcolor,Image1);
            Y:=Y-1;
            oldcolor:=SetOldColor(pole[Y,X]);   //���� ����, �� ������� ����� ���������.
            end;
            end;

 VK_DOWN:   begin
            if Y<>20 then begin
            DrawRectangle (Y,X,oldcolor,Image1);
            Y:=Y+1;
            oldcolor:=SetOldColor(pole[Y,X]);
            end;
            end;

 VK_LEFT:   begin
            if X<>0 then begin
            DrawRectangle (Y,X,oldcolor,Image1);
            X:=X-1;
            oldcolor:=SetOldColor(pole[Y,X]);
            end;
            end;

 VK_RIGHT:  begin
            if X<>20 then begin
            DrawRectangle (Y,X,oldcolor,Image1);
            X:=X+1;
            oldcolor:=SetOldColor(pole[Y,X]);
            end;
            end;

 VK_RETURN: begin
            if pole[Y,X]<>0 then   begin
            DeleteRectangle (X,Y,NumberClearX,MaxLongWay,color,oldcolor,Image1,pole,masRecord,Score,Win,Label2,Label4,history1,history2,history3,history4,history5);     //��������.
            end;
            end;

           end;

Place(color,image1,Point,X,Y);
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.FormCreate(Sender: TObject);
var i,j,k: integer;
begin

X:=0;
Y:=0;
NumberClearX:=0; //���������� ������ �������.
Score:=0;        //����
MaxLongWay:=0;   //������������ ������ �������.
Win:=false;      //������� ��� ���.
for i := 1 to 3 do begin
  masrecord[i]:=-1;
end;


for I := 0 to 20 do begin  //��������� �������� ����.
for j := 0 to 20 do begin
k:=random(3)+1;
case k of
1: begin color:=SetOldColor(k); pole[i,j]:=1 end;
2: begin color:=SetOldColor(k); pole[i,j]:=2 end;
3: begin color:=SetOldColor(k); pole[i,j]:=3 end;
end;
DrawRectangle (i,j,color,Image1);
end; //����� ����� j
end; //����� ����� i

oldcolor:=SetOldColor(pole[Y,X]); //���� ����, �� ������� ����� ���������.
Place(color,image1,Point,X,Y);    //����, �� ������� ����� ���������.
label2.Caption:=inttostr(Score);  //����.
label4.Caption:=('+0');           //������.
  history1.caption:='';           //������� �����.
  history2.caption:='';
  history3.caption:='';
  history4.caption:='';
  history5.caption:='';

end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.N1Click(Sender: TObject);
var i,j,k: integer;
begin

X:=0;
Y:=0;
NumberClearX:=0;
Score:=0;
MaxLongWay:=0;
Win:=false;
for i := 1 to 3 do begin
  masrecord[i]:=-1;
end;

for I := 0 to 20 do begin
for j := 0 to 20 do begin

k:=random(3)+1;
case k of
1: begin color:=SetOldColor(k);   pole[i,j]:=1 end;
2: begin color:=SetOldColor(k);  pole[i,j]:=2 end;
3: begin color:=SetOldColor(k); pole[i,j]:=3 end;
end;
DrawRectangle (i,j,color,Image1);
end; //����� ����� j
end; //����� ����� i

oldcolor:=SetOldColor(pole[Y,X]);
Place(color,image1,Point,X,Y);
label2.Caption:=inttostr(Score);
label4.Caption:=('+0');
  history1.caption:='';
  history2.caption:='';
  history3.caption:='';
  history4.caption:='';
  history5.caption:='';

end;

procedure TForm1.N2Click(Sender: TObject);
var i: Integer; j: Integer;
begin

Form1.Enabled:=false;
Form3.Label1.Visible:=false;
Form3.Label2.Visible:=false;
Form3.Show;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Form1.Close;
Form2.Close;
Form3.Close;
end;

end.

