class Paciente < ApplicationRecord
    has_many :consultums
    has_many :medicos, through: :consultums
end
