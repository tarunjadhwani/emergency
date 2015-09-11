Faker::Config.locale = 'en-IND'

# Doctor
42.times do
  doctor = Doctor.new(
      name: Faker::Name.name,
      mobile: Faker::PhoneNumber.cell_phone,
      address: "J.P. Nagar, Bangalore",
      lat: (12.88..12.92).step(0.000001).map { |x| x.round(6) }.sample,
      long: (77.57..77.59).step(0.000001).map { |x| x.round(6) }.sample,
      type: ['Nurse', 'CprExpert', 'ResidentDoctor', 'ErDoctor'].sample
    )
  unless doctor.save
    ap doctor.errors.messages
  end
end