json.extract! paciente, :id, :nome, :ficha, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
