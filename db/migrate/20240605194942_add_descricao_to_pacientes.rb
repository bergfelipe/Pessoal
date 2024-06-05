class AddDescricaoToPacientes < ActiveRecord::Migration[7.1]
  def change
    add_column :pacientes, :descricao, :string
  end
end
