class Consultum < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente

  accepts_nested_attributes_for :paciente, reject_if: :all_blank, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "data_consulta", "ficha", "id", "id_value", "medico_id", "paciente_id", "tipo", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["medico", "paciente"]
  end

end
