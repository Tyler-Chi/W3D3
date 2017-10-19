class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { message: "Email already has an associated account. Would you like to reset your password?" }

  has_many :shortened_urls,
  primary_key: :id,
  foreign_key: :submitter_id,
  class_name: 'ShortenedUrl'

  has_many :visits,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'Visits'

  has_many :visited_urls,
  Proc.new {distinct},
  through: :visits,
  source: :shortened_urls




end
