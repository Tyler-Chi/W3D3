class Course < ApplicationRecord

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: 'Enrollment'
  #Course.id = Enrollments.course_id



  has_many :enrolled_students,
  through: :enrollments,
  source: :student

  belongs_to :prerequisite,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: 'Course',
  optional: true

  has_many :child_courses,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: 'Course'

  belongs_to :instructor,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: 'User'

  JOIN users ON users.id = courses.instructor_id




end




# Now, things get tricky. Add an association for prerequisite. This should return a course's prereq (if it has one).
#
# Finally, add an instructor association to Course. This will point to a User object. Note that Course is now related to User in two ways: instructor and enrolled_students.
#
# Call over a TA and show them your associations code.











































#
# has_many :enrollments,
# primary_key: :id,
# foreign_key: :course_id,
# class_name: 'Enrollment'
#
# has_many :students,
# through: :enrollments,
# source: :users
