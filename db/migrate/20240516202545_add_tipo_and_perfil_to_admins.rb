class AddTipoAndPerfilToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :tipo, :string
    add_column :admins, :perfil, :string
  end
end
