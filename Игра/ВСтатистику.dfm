object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1082#1086#1088#1076#1086#1074
  ClientHeight = 304
  ClientWidth = 539
  Color = clHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 136
    Width = 69
    Height = 32
    Caption = #1048#1084#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 37
    Top = 32
    Width = 494
    Height = 32
    Caption = #1042#1099' '#1087#1086#1087#1072#1083#1080' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1088#1077#1082#1086#1088#1076#1086#1074'.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 37
    Top = 70
    Width = 290
    Height = 32
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1077' '#1080#1084#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 160
    Top = 145
    Width = 257
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 160
    Top = 224
    Width = 217
    Height = 40
    Caption = #1054#1082
    TabOrder = 1
    OnClick = Button1Click
  end
end
