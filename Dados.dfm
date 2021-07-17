object FDados: TFDados
  OldCreateOrder = False
  Height = 255
  Width = 333
  object FDConnection: TFDConnection
    Params.Strings = (
      'CharacterSet=UTF8'
      'Server='
      'Port='
      'DriverID=PG'
      'User_Name=postgres'
      'Database=testedados'
      'Password=admin')
    UpdateOptions.AssignedValues = [uvRefreshMode]
    LoginPrompt = False
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    Left = 32
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 32
    Top = 72
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Anderson\Desktop\EstudoBancoDados\Win32\Debug\libpq.dll'
    Left = 32
    Top = 136
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrAppWait
    Left = 32
    Top = 192
  end
  object QryAux: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      '')
    Left = 120
    Top = 16
  end
  object QryFuncionarios: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select * from funcionarios')
    Left = 120
    Top = 72
    object QryFuncionariosmatricula: TIntegerField
      FieldName = 'matricula'
      Origin = 'matricula'
    end
    object QryFuncionariosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 150
    end
    object QryFuncionariossalario: TBCDField
      FieldName = 'salario'
      Origin = 'salario'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFuncionarioshora_mes: TBCDField
      FieldName = 'hora_mes'
      Origin = 'hora_mes'
      Precision = 10
      Size = 2
    end
    object QryFuncionarioscpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 150
    end
    object QryFuncionariosnis: TWideStringField
      FieldName = 'nis'
      Origin = 'nis'
      Size = 150
    end
    object QryFuncionariostipo_folha: TWideStringField
      FieldName = 'tipo_folha'
      Origin = 'tipo_folha'
      Size = 50
    end
  end
  object QryFolha: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select * from folha_pagamento')
    Left = 120
    Top = 136
    object QryFolhaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object QryFolhamatricula: TIntegerField
      FieldName = 'matricula'
      Origin = 'matricula'
    end
    object QryFolhadias_trabalhado: TBCDField
      FieldName = 'dias_trabalhado'
      Origin = 'dias_trabalhado'
      Precision = 10
      Size = 2
    end
    object QryFolhavalor_dias_trabalhado: TBCDField
      FieldName = 'valor_dias_trabalhado'
      Origin = 'valor_dias_trabalhado'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhahoras_extra_50: TBCDField
      FieldName = 'horas_extra_50'
      Origin = 'horas_extra_50'
      Precision = 10
      Size = 2
    end
    object QryFolhavalor_horas_extra_50: TBCDField
      FieldName = 'valor_horas_extra_50'
      Origin = 'valor_horas_extra_50'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhahoras_extra_75: TBCDField
      FieldName = 'horas_extra_75'
      Origin = 'horas_extra_75'
      Precision = 10
      Size = 2
    end
    object QryFolhavalor_horas_extra_75: TBCDField
      FieldName = 'valor_horas_extra_75'
      Origin = 'valor_horas_extra_75'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhahoras_extra_100: TBCDField
      FieldName = 'horas_extra_100'
      Origin = 'horas_extra_100'
      Precision = 10
      Size = 2
    end
    object QryFolhavalor_horas_extra_100: TBCDField
      FieldName = 'valor_horas_extra_100'
      Origin = 'valor_horas_extra_100'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhadesconto_inss_padrao: TBCDField
      FieldName = 'desconto_inss_padrao'
      Origin = 'desconto_inss_padrao'
      Precision = 10
      Size = 2
    end
    object QryFolhadesconto_inss: TBCDField
      FieldName = 'desconto_inss'
      Origin = 'desconto_inss'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhavigencia: TWideStringField
      FieldName = 'vigencia'
      Origin = 'vigencia'
      Size = 100
    end
    object QryFolhatotal_proventos: TBCDField
      FieldName = 'total_proventos'
      Origin = 'total_proventos'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhatotal_descontos: TBCDField
      FieldName = 'total_descontos'
      Origin = 'total_descontos'
      currency = True
      Precision = 10
      Size = 2
    end
    object QryFolhatotal_receber: TBCDField
      FieldName = 'total_receber'
      Origin = 'total_receber'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = QryFuncionarios
    Left = 208
    Top = 72
  end
  object dsFolha: TDataSource
    DataSet = QryFolha
    Left = 208
    Top = 136
  end
end
