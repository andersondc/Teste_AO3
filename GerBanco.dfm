object FGerBanco: TFGerBanco
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Logar Banco de Dados'
  ClientHeight = 191
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 191
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 273
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 29
      Height = 13
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 16
      Top = 128
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 158
      Height = 52
      Caption = 
        'N'#227'o foi Poss'#237'vel Acessar Banco de Dados Padr'#227'o, por favor entre ' +
        'com a senha definida.'
      WordWrap = True
    end
    object vLogin: TEdit
      Left = 16
      Top = 99
      Width = 129
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
      Text = 'postgres'
    end
    object vSenha: TEdit
      Left = 16
      Top = 147
      Width = 129
      Height = 21
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 177
      Top = 1
      Width = 127
      Height = 189
      Align = alRight
      Color = clGray
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 201
      object Button1: TButton
        AlignWithMargins = True
        Left = 4
        Top = 129
        Width = 119
        Height = 25
        Align = alBottom
        Caption = 'OK'
        TabOrder = 0
        OnClick = Button1Click
        ExplicitLeft = 46
        ExplicitTop = 119
        ExplicitWidth = 81
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 4
        Top = 160
        Width = 119
        Height = 25
        Align = alBottom
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = Button2Click
        ExplicitLeft = 6
        ExplicitTop = 150
        ExplicitWidth = 81
      end
      object DadosLogin: TListBox
        Left = 3
        Top = 6
        Width = 121
        Height = 61
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
    end
  end
end
