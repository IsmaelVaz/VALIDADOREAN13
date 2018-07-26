object AboutBox: TAboutBox
  Left = 200
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Sobre'
  ClientHeight = 283
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 418
    Height = 236
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProductName: TLabel
      Left = 144
      Top = 0
      Width = 115
      Height = 24
      Caption = 'COMO USAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
    object Version: TLabel
      Left = 8
      Top = 32
      Width = 97
      Height = 20
      Caption = 'Para 1 c'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
    object Copyright: TLabel
      Left = 24
      Top = 58
      Width = 325
      Height = 13
      Caption = 
        'Basta digitar o c'#243'digo na caixa de texto de depois clicar em "Va' +
        'lidar"'
      IsControl = True
    end
    object Comments: TLabel
      Left = 24
      Top = 120
      Width = 309
      Height = 26
      Caption = 
        'Clique no bot'#227'o "Selecionar", selecione o aquivo e depois clique' +
        ' no bot'#227'o "Validar"'
      WordWrap = True
      IsControl = True
    end
    object Label1: TLabel
      Left = 8
      Top = 94
      Width = 103
      Height = 20
      Caption = 'Para 1 Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
    object Label2: TLabel
      Left = 8
      Top = 151
      Width = 145
      Height = 20
      Caption = 'Estrutura do Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
    object Label3: TLabel
      Left = 24
      Top = 177
      Width = 210
      Height = 13
      Caption = 'O arquivo dever'#225' conter um c'#243'digo por linha'
      WordWrap = True
      IsControl = True
    end
  end
  object OKButton: TButton
    Left = 176
    Top = 250
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
