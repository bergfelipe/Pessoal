module ApplicationHelper
    def formatar_data_hora_minuto(datetime)
        datetime.strftime("%d/%m/%Y %H:%M")
    end

    def tempo_restante(data_consulta)
      # Certifique-se de que data_consulta seja um objeto Time
      data_consulta = data_consulta.to_time if data_consulta.respond_to?(:to_time)
    
      # Use Time.now para obter o horário atual
      now = Time.now
    
      # Verifique se a data da consulta é no mesmo dia
      if data_consulta.to_date != now.to_date
        return "consulta não é hoje"
      end
    
      # Extraia a hora e os minutos de data_consulta e now
      data_consulta_time = Time.new(now.year, now.month, now.day, data_consulta.hour, data_consulta.min, 0)
      now_time = Time.new(now.year, now.month, now.day, now.hour, now.min, 0)
    
      # Calcule a diferença em segundos
      diferenca_em_segundos = data_consulta_time - now_time
    
      # Verifique se a consulta já ocorreu
      if diferenca_em_segundos <= 0
        return "consulta já ocorreu"
      end
    
      # Converta a diferença para minutos
      diferenca_em_minutos = (diferenca_em_segundos / 60).to_i
    
      # Mostre a diferença em horas se for maior que 60 minutos
      if diferenca_em_minutos >= 60
        horas_restantes = diferenca_em_minutos / 60
        minutos_restantes = diferenca_em_minutos % 60
        if minutos_restantes > 0
          "faltam #{horas_restantes} horas e #{minutos_restantes} minutos para a consulta"
        else
          "faltam #{horas_restantes} horas para  para a consulta"
        end
      else
        "faltam #{diferenca_em_minutos} minutos para  para a consulta"
      end
    end
    
    
    
    
    
    
    
end