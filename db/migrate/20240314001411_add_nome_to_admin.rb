class AddNomeToAdmin < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :nome, :string
  end
end
