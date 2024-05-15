class Consultum < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente

  accepts_nested_attributes_for :paciente, reject_if: :all_blank, allow_destroy: true
end
