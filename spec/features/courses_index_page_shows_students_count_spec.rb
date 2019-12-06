require 'rails_helper'

RSpec.describe "courses#index" do
  it "shows course list and student count" do
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
    class_2 = StudentCourse.create(student_id: ron.id,
                                  course_id: potions.id)
    class_1 = StudentCourse.create(student_id: luna.id,
                                  course_id: herbology.id)

    visit '/courses'
    within("#course-#{herbology.id}") do
      expect(page).to have_content(herbology.name)
      expect(page).to have_content("Students: 2")
    end
    within("#course-#{potions.id}") do
      expect(page).to have_content(potions.name)
      expect(page).to have_content("Students: 1")
    end
  end
end



# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.
#
# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")
