# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all


10.times do 
    city = City.create!(name: Faker::Nation.capital_city)
    specialty = Specialty.create!(name: Faker::Beer.name)
    doctor = Doctor.create!(first_name: Faker::Superhero.prefix, last_name: Faker::Superhero.descriptor, postal_code: Faker::Number.between(10000, 95000), city: city)
    doctor.specialties = doctor.specialties << specialty
    specialty.doctors = specialty.doctors << doctor
    patient = Patient.create!(first_name: Faker::Superhero.prefix, last_name: Faker::Beer.name, city: city)
    appointment = Appointment.create!(date: Faker::Date.between(2.days.ago, Date.today), doctor: doctor, patient: patient, city: city)

end

