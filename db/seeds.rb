# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# 
Appointment.destroy_all
Practice.destroy_all

User.create(email:"dev@connectient.co", password:"Pass!word!22")
User.create(email:"dev2@connectient.co", password:"Pass!word!22")


Practice.create(
  name: "Downtown Dental",
  street_address: "123 Main St",
  city: "Metropolis",
  email: "contact@downtowndental.com",
  phone: "555-1234",
  practice_code: "downtown-dental",
  logo: "logo.png",
  facebook: "facebook.com/downtowndental",
  instagram: "instagram.com/downtowndental",
  website: "www.downtowndental.com",
  user_id: User.first.id
)

Practice.create(
  name: "Uptown Health Clinic",
  street_address: "456 Elm St",
  city: "Springfield",
  email: "info@uptownclinic.com",
  phone: "555-9876",
  practice_code: "uptown-health",
  logo: "uptown_logo.png",
  facebook: "facebook.com/uptownhealth",
  instagram: "instagram.com/uptownhealth",
  website: "www.uptownclinic.com",
  user_id: User.last.id
)


10.times do
  time_options = ["morning", "afternoon", "flexible"]
  appointment_options = %w[hygiene, filling, extraction, other]
  time = Faker::Time.forward(days: 14, period: :morning)
  time_only = time.strftime("%H:%M:%S")
  practice_ids = [Practice.first.id, Practice.second.id]

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
    appointment_type: appointment_options.sample,
    practice_id: practice_ids.sample
  )
end

