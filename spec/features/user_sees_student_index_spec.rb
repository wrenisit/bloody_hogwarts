require 'rails_helper'

RSpec.describe "students#index" do
  it "shows student list" do
    ron = Student.create(name: "Ron Weasley",
                        age: 14,
                        house: "Gryffindor")
    ginny = Student.create(name: "Ginny Weasley",
                        age: 13,
                        house: "Gryffindor")
    luna = Student.create(name: "Luna Lovegood",
                        age: 14,
                        house: "Ravenclaw")

    visit '/students'

    within("#student-#{ron.id}") do
      expect(page).to have_content(ron.name)
      expect(page).to have_content(ron.age)
      expect(page).to have_content(ron.house)
      expect(page).to_not have_content(luna.name)
      expect(page).to_not have_content(luna.house)
    end

    within("#student-#{ginny.id}") do
      expect(page).to have_content(ginny.name)
      expect(page).to have_content(ginny.age)
      expect(page).to have_content(ginny.house)
      expect(page).to_not have_content(luna.name)
      expect(page).to_not have_content(luna.age)
      expect(page).to_not have_content(luna.house)
    end

    within("#student-#{luna.id}") do
      expect(page).to have_content(luna.name)
      expect(page).to have_content(luna.age)
      expect(page).to have_content(luna.house)
      expect(page).to_not have_content(ginny.name)
      expect(page).to_not have_content(ginny.age)
      expect(page).to_not have_content(ginny.house)
    end
  end
end

# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")
