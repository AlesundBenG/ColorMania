program Project1;

uses
  Vcl.Forms,
  ���� in '����.pas' {Form1},
  ������� in '�������.pas' {Form2},
  ��������� in '���������.pas' {Form3},
  ����������� in '�����������.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
