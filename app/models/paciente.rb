class Paciente < ApplicationRecord
    has_many :consultums
    has_many :medicos, through: :consultums

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "descricao", "ficha", "id", "id_value", "nome", "updated_at"]
        end
end
