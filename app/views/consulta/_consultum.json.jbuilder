json.extract! consultum, :id, :medico_id, :paciente_id, :data_consulta, :ficha, :tipo, :created_at, :updated_at
json.url consultum_url(consultum, format: :json)
