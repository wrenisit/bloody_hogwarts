require 'rails_helper'

RSpec.describe "students#show" do
  it "shows student show page" do
    ron = Student.create(name: "Ron Weasley",
                        age: 14,
                        house: "Gryffindor")
    ginny = Student.create(name: "Ginny Weasley",
                        age: 13,
                        house: "Gryffindor")
    luna = Student.create(name: "Luna Lovegood",
                        age: 14,
                        house: "Ravenclaw")
    herbology = Course.create(name: "Herbology")
    potions = Course.create(name: "Potions")

    class_1 = StudentCourse.create(student_id: ron.id,
                                  course_id: herbology.id)

    visit "/students/#{ron.id}"
    expect(page).to have_content("#{ron.name}")
    expect(page).to have_content("Herbology")

    class_2 = StudentCourse.create(student_id: ron.id,
                                  course_id: potions.id)

    visit "/students/#{ron.id}"
    expect(page).to have_content("#{ron.name}")
    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
  end
end

# As a visitor,
# When I visit '/students/:id'
# I see a list of the students' courses.
#
# (e.g. "Defense against the Dark Arts"
#       "Herbology"
#       "Potions")
