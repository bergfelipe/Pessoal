class AddCpfToMedicos < ActiveRecord::Migration[7.1]
  def change
    add_column :medicos, :cpf, :string
  end
end
