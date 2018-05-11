# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

educations = [
    "none",
    "high school",
    "bachelors",
    "masters",
    "phd",
]

courses = [
    "Web Development",
    "UI/UX",
    "Product"
]

hours = [
    0,
    80,
    160
]

courses.each do |course|
    Course.create(name: course, hours: (400 + hours[rand(3)]))
end

5.times do
    course_id = (rand(3) + 1)
    duration_weeks = (Course.find(course_id).hours / (8 * 5))
    start_date = Date.today
    Cohort.create(name: Faker::App.name, start_date: start_date, end_date: (start_date + duration_weeks.weeks), course_id: course_id)
end



5.times do |i|
    puts i
    Instructor.create(cohort_id: i+1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.between(25, 50), highest_education: educations[rand(5)], salary: rand(70000...100000) )
end

50.times do
    Student.create(cohort_id: rand(5) +1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.between(18, 30), highest_education: educations[rand(5)])
end

