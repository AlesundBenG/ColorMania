object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  ClientHeight = 663
  ClientWidth = 1144
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1144
    Height = 663
    Align = alClient
    Color = clHighlight
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 72
      Width = 86
      Height = 32
      Caption = #1057#1095#1077#1090':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 48
      Top = 140
      Width = 358
      Height = 32
      Caption = #1057#1072#1084#1103' '#1076#1083#1080#1085#1085#1072#1103' '#1094#1077#1087#1086#1095#1082#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 406
      Top = 195
      Width = 290
      Height = 32
      Caption = #1058#1072#1073#1083#1080#1094#1099' '#1088#1077#1082#1086#1088#1076#1086#1074':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 399
      Top = 266
      Width = 290
      Height = 32
      Caption = #1056#1077#1082#1086#1088#1076#1099' '#1087#1086' '#1086#1095#1082#1072#1084':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 69
      Top = 266
      Width = 239
      Height = 32
      Caption = #1054#1095#1080#1089#1090#1080#1083#1080' '#1087#1086#1083#1077':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 735
      Top = 266
      Width = 358
      Height = 32
      Caption = #1057#1072#1084#1103' '#1076#1083#1080#1085#1085#1072#1103' '#1094#1077#1087#1086#1095#1082#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Score: TLabel
      Left = 140
      Top = 72
      Width = 18
      Height = 32
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LongWay: TLabel
      Left = 424
      Top = 140
      Width = 18
      Height = 32
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 48
      Top = 16
      Width = 18
      Height = 32
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object RecordResult: TMemo
      Left = 399
      Top = 336
      Width = 346
      Height = 281
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object RecordLongWay: TMemo
      Left = 768
      Top = 336
      Width = 346
      Height = 281
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object ListBox1: TListBox
      Left = 69
      Top = 336
      Width = 242
      Height = 281
      Color = clHighlight
      ItemHeight = 13
      TabOrder = 2
    end
    object FinishGame: TMemo
      Left = 24
      Top = 336
      Width = 346
      Height = 281
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
end
