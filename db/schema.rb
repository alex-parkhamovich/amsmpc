# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170421094250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctor_personals", force: :cascade do |t|
    t.integer  "doctor_user_id",                         null: false
    t.string   "address",                                null: false
    t.string   "city",                                   null: false
    t.string   "phone",                                  null: false
    t.string   "clinic",           default: "no_clinic"
    t.string   "speciality",                             null: false
    t.string   "license_id_photo",                       null: false
    t.string   "face_photo",                             null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "doctor_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.date     "birthdate",                              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "registration_status",    default: "new", null: false
    t.index ["email"], name: "index_doctor_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_doctor_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "patient_personals", force: :cascade do |t|
    t.integer  "patient_user_id", null: false
    t.string   "address",         null: false
    t.string   "city",            null: false
    t.string   "phone",           null: false
    t.string   "gender",          null: false
    t.string   "face_photo",      null: false
    t.string   "id_photo",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "patient_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.date     "birthdate",                              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "registration_status",    default: "new", null: false
    t.index ["email"], name: "index_patient_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_patient_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "super_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_super_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_super_users_on_reset_password_token", unique: true, using: :btree
  end

end
