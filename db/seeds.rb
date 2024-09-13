# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# 

Appointment.destroy_all

10.times do
  time_options = ["morning", "afternoon", "flexible"]
  appointment_options = %w[hygiene, filling, extraction, other]
  time = Faker::Time.forward(days: 14, period: :morning)
  time_only = time.strftime("%H:%M:%S")

  Appointment.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    mobile_phone: Faker::PhoneNumber.cell_phone,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    requested_date: Faker::Date.forward(from: ::Date.today, days: 5),
    requested_time: time_options.sample,
    scheduled_date: Date.today,
    scheduled_time: time_only,
    is_emergency: Faker::Boolean.boolean(true_ratio: 0.25),
    appointment_type: appointment_options.sample
  )
end

Practice.create(
  name: "Downtown Dental",
  street_address: "123 Main St",
  city: "Metropolis",
  email: "contact@downtowndental.com",
  phone: "555-1234",
  practice_code: "DT123",
  logo: "logo.png",
  facebook: "facebook.com/downtowndental",
  instagram: "instagram.com/downtowndental",
  website: "www.downtowndental.com"
)

Practice.create(
  name: "Uptown Health Clinic",
  street_address: "456 Elm St",
  city: "Springfield",
  email: "info@uptownclinic.com",
  phone: "555-9876",
  practice_code: "UPT456",
  logo: "uptown_logo.png",
  facebook: "facebook.com/uptownhealth",
  instagram: "instagram.com/uptownhealth",
  website: "www.uptownclinic.com"
)