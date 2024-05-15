class Medico < ApplicationRecord
    has_many :consultums
    has_many :pacientes, through: :consultums
    
    accepts_nested_attributes_for :consultums, :reject_if => :all_blank, allow_destroy: true

end
