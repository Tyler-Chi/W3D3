class User < ApplicationRecord
  has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: 'Enrollment'

  has_many :enrolled_courses,
  through: :enrollments,
  source: :course
end

















































# has_many :enrollments123,
# primary_key: :id,
# foreign_key: :student_id,
# class_name: 'Enrollment'
#
# has_many :courses,
# through: :enrollments123, #has to be through an association we have already built
# source: :course


#the has many courses is an arbitrrary name
#through enrollments123, looks at the enrollments123
#merthod inside the USER
#looks at the foreign key in there, which is
#the student_id that exists in Enrollment

# <<-SQL, self.id
#   SELECT *
#   FROM users
#   JOIN enrollments ON users.id = enrollments.student_id
#   WHERE users.id = ?
#
#
# SQL


# <<-SQL
#   SELECT *
#   FROM enrollments
#   JOIN users ON enrollments.id = users.student_id
#
# SQL
