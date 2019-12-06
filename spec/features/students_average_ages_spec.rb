require 'rails_helper'

RSpec.describe "students#index" do
  it "shows average age" do

    ron = Student.create(name: "Ron Weasley",
                        age: 14,
                        house: "Gryffindor")
    ginny = Student.create(name: "Ginny Weasley",
                        age: 13,
                        house: "Gryffindor")
    luna = Student.create(name: "Luna Lovegood",
                        age: 15,
                        house: "Ravenclaw")

    visit '/students'
    expect(page).to have_content("Average Age: 14")
  end
end


#
# User Story 4 of 4
#
# As a visitor,
# When I visit '/students'
# I see the average age of all students.
#
# (e.g. "Average Age: 14.5")
