class CreateMedicos < ActiveRecord::Migration[7.1]
  def change
    create_table :medicos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
