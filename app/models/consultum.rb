class Consultum < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente
  enum status: { apagada: 0, ativa: 1, concluida: 2, fechada: 3, em_andamento: 4}
  accepts_nested_attributes_for :paciente, reject_if: :all_blank, allow_destroy: true

  def tempo_restante
    distance_of_time_in_words(Time.now, data_consulta)
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["status_eq", "created_at", "data_consulta", "ficha", "id", "id_value", "medico_id", "paciente_id", "tipo", "updated_at"]
  end
  
  
  def self.ransackable_associations(auth_object = nil)
    ["medico", "paciente"]
  end

end
