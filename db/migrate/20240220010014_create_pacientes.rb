class CreatePacientes < ActiveRecord::Migration[7.1]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :ficha

      t.timestamps
    end
  end
end
