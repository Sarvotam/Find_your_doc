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

ActiveRecord::Schema.define(version: 20171026105328) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "appointment_status"
    t.text     "cancellation_reason"
    t.text     "health_history"
    t.integer  "doctor_id"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "doctor_specializations", force: :cascade do |t|
    t.string   "name"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_specializations_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.text     "professional_statement"
    t.date     "practicing_from"
    t.string   "profile_image"
    t.string   "certificate_image"
    t.integer  "fax_number"
    t.boolean  "award"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
    t.index [nil], name: "index_doctors_on_user"
  end

  create_table "hospital_affiliations", force: :cascade do |t|
    t.string   "affilation"
    t.string   "city"
    t.string   "country"
    t.date     "start_date"
    t.string   "contact"
    t.string   "address"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_hospital_affiliations_on_doctor_id"
  end

  create_table "offices", force: :cascade do |t|
    t.time     "time_slot_per_patient_in_minute"
    t.integer  "first_consultation_fee"
    t.integer  "followup_consultation_fee"
    t.string   "name"
    t.string   "contact"
    t.integer  "room_number"
    t.integer  "doctor_id"
    t.integer  "hospital_affiliation_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["doctor_id"], name: "index_offices_on_doctor_id"
    t.index ["hospital_affiliation_id"], name: "index_offices_on_hospital_affiliation_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.text     "qualification_name"
    t.string   "institute_name"
    t.string   "language"
    t.text     "board_certification"
    t.date     "procurement_year"
    t.integer  "doctor_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["doctor_id"], name: "index_qualifications_on_doctor_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "wait_time_rating"
    t.float    "bedside_manner_rating"
    t.float    "overall_rating"
    t.text     "review"
    t.boolean  "is_recommended"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "doctor_id"
    t.index ["doctor_id"], name: "index_reviews_on_doctor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index [nil], name: "index_reviews_on_user"
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "name"
    t.integer  "doctor_specialization_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["doctor_specialization_id"], name: "index_specializations_on_doctor_specialization_id"
  end

  create_table "time_schedules", force: :cascade do |t|
    t.time     "slot_time"
    t.date     "slot_date"
    t.string   "day_of_week"
    t.integer  "hospital_affiliation_id"
    t.integer  "doctor_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["doctor_id"], name: "index_time_schedules_on_doctor_id"
    t.index ["hospital_affiliation_id"], name: "index_time_schedules_on_hospital_affiliation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "Last_name"
    t.string   "contact_number"
    t.string   "username"
    t.string   "address"
    t.date     "date_of_birth"
    t.integer  "gender"
    t.integer  "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
