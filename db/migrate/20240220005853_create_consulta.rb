class CreateConsulta < ActiveRecord::Migration[7.1]
  def change
    create_table :consulta do |t|
      t.references :medico, null: false, foreign_key: true
      t.references :paciente, null: false, foreign_key: true
      t.datetime :data_consulta
      t.string :ficha
      t.string :tipo

      t.timestamps
    end
  end
end
