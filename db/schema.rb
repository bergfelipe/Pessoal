# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_24_201412) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "cpf"
    t.string "tipo"
    t.string "perfil"
    t.index ["cpf"], name: "index_admins_on_cpf", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "consulta", force: :cascade do |t|
    t.integer "medico_id", null: false
    t.integer "paciente_id", null: false
    t.datetime "data_consulta"
    t.string "ficha"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1
    t.string "favorito"
    t.index ["medico_id"], name: "index_consulta_on_medico_id"
    t.index ["paciente_id"], name: "index_consulta_on_paciente_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "ficha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descricao"
  end

  add_foreign_key "consulta", "medicos"
  add_foreign_key "consulta", "pacientes"
end
