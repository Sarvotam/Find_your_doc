# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


patient1 = User.create!(email: "patient1@gmail.com", username: "Patient1", first_name: "Patient1", Last_name: "suwal", date_of_birth: "02-04-2001", user_type: 1, password: "patient1", contact_number: 34234324, gender: 0, address: "Bhaktapur")
patient2  = User.create!(email: "patient2@gmail.com", username: "Patient2", first_name: "Patient1",Last_name: "suwal", date_of_birth: "02-04-2001", user_type: 1, password: "patient2", contact_number: 3462224, gender: 0, address: "Kathmandu")
doctor1 = User.create!(email: "doctor1@gmail.com", first_name: "Doctor1", username: "Doctor1",Last_name: "suwal", date_of_birth: "02-04-2001", user_type: 0, password: "doctor1",contact_number: 3423434324, gender: 0, address: "BKT")
doctor2 = User.create!(email: "doctor2@gmail.com", first_name: "Doctor2", username: "Doctor2",Last_name: "suwal", date_of_birth: "02-04-2001", user_type: 0, password: "doctor2",contact_number: 3423416324, gender: 0, address: "KTM")

doc1 = Doctor.create!(profile_confirmation: true, user_id: doctor1.id)
doc2 = Doctor.create!(user_id: doctor2.id)


Appointment.create!(user_id: patient1.id, doctor_id: doc1.id, health_history: "strong")
Appointment.create!(user_id: patient1.id, doctor_id: doc2.id, health_history: "weak")
Appointment.create!(user_id: patient2.id, doctor_id: doc1.id, health_history: "stronger")
Appointment.create!(user_id: patient2.id, doctor_id: doc2.id, health_history: "weaker")

# Book.create!(title: "Britney Speares: An Anthology", genre_id: biographies.id, author_id: vader.id, sales: 950)
# Book.create!(title: "Only One Direction", genre_id: biographies.id, author_id: vader.id, sales: 45)
# Book.create!(title: "DIY Deathstar", genre_id: non_fiction.id, author_id: vader.id, sales: 1200)
Qualification.create!(doctor_id: doc1.id, qualification_name: "pro doctor", institute_name: "NCCS", language: "Nepali", board_certification: "SLC", procurement_year: "2008")

