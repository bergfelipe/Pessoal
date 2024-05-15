module ApplicationHelper
    def formatar_data_hora_minuto(datetime)
        datetime.strftime("%d/%m/%Y %H:%M")
    end
end
