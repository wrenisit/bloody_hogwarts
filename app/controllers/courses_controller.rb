class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @course_info = Hash.new(0)
    all = StudentCourse.all
    all.each do |record|
        @course_info[record.course_id] += 1
    end
  end
end
