module ApplicationHelper
    def formatar_data_hora_minuto(datetime)
        datetime.strftime("%d/%m/%Y %H:%M")
    end

    def tempo_restante(data_consulta)
        diferenca = ((data_consulta - Time.now) / 60).to_i
        if diferenca > 0
          "daqui a #{diferenca} minutos"
        else
          "consulta já ocorreu"
        end
      end
end
