object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Validar C'#243'digo EAN13'
  ClientHeight = 219
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbtnSelecionarArquivo: TSpeedButton
    Left = 336
    Top = 24
    Width = 81
    Height = 22
    Caption = 'Selecionar'
    OnClick = sbtnSelecionarArquivoClick
  end
  object sbtnValidar: TSpeedButton
    Left = 312
    Top = 56
    Width = 105
    Height = 22
    Caption = 'Validar C'#243'digos'
    OnClick = sbtnValidarClick
  end
  object sbtnDuvida: TSpeedButton
    Left = 24
    Top = 51
    Width = 23
    Height = 22
    Caption = '?'
    OnClick = sbtnDuvidaClick
  end
  object Label1: TLabel
    Left = 24
    Top = 79
    Width = 78
    Height = 13
    Caption = 'C'#243'digos Errados'
  end
  object edtCaminhoArquivo: TEdit
    Left = 24
    Top = 24
    Width = 289
    Height = 21
    Hint = 'Caminho do arquivo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object memoCodigosNaoValidos: TMemo
    Left = 24
    Top = 98
    Width = 393
    Height = 115
    Lines.Strings = (
      'memoCodigosNaoValidos')
    ReadOnly = True
    TabOrder = 1
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 232
    Top = 56
  end
end
