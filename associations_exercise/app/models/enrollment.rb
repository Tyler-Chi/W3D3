class Enrollment < ApplicationRecord
  belongs_to :student,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: 'User'


  # THIS JOINS THE enrollsment.student_id = student.id
  # the left side of that is just from the enrollments table, looking
  # at the student_id column. nOW it, is joining it to the student.id.
  #it knows student because of class name user, and it is looking that primary key.

  belongs_to :course,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: 'Course'

  #enrollment.course_id = Course.id
end

# users JOIN on students.id = enrollments.student_id
# enrollments JOIn ON enrollments.student_id = students.id





















































#
# belongs_to :course,
# primary_key: :id,
# foreign_key: :course_id,
# class_name: 'Course'
#
# belongs_to :user,
# primary_key: :id,
# foreign_key: :student_id,
# class_name: 'User'
