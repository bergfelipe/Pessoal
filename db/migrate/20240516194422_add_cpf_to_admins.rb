class AddCpfToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :cpf, :string
    add_index :admins, :cpf, unique: true
  end
end
