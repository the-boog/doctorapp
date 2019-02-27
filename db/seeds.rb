5.times do |doctor|
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: Faker::Games::HeroesOfTheStorm.class
  )
end

5.times do |patient|
  Patient.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  issue: Faker::Games::Pokemon.move
  )
end

@doctor = Doctor.all.collect { |x| x.id }
@patient = Patient.all.collect { |x| x.id }

5.times do |appointment|
  Appointment.create(
    date: Faker::Date.forward(23),
    doctor_id: @doctor.sample,
    patient_id: @patient.sample
  )

end