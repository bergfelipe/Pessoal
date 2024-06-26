class AddStatusAndFavoritoToConsultum < ActiveRecord::Migration[7.1]
  def change
    add_column :consultas, :status, :integer, default: 1 # Ativa por padrão
    add_column :consultas, :favorito, :string
  end
end
