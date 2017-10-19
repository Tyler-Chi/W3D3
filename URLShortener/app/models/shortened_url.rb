#in the model, it is camelcase!
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :submitter_id,
  class_name: 'User'

  has_many :visits,
  primary_key: :id,
  foreign_key: :shortened_url_id,
  class_name: 'Visit'

  has_many :visitors,
  Proc.new{distinct},
  through: :visits,
  source: :users

  def self.random_code
    #user is object, long_url is a string
    unique = false
    until unique
      output = SecureRandom.base64(10) #10 refers to number of BYTES
      #if output is unique, then we reset unique to be true
      unique = true unless ShortenedUrl.exists?(:short_url => output)
    end
    output
  end

  def self.generate!(user,long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select('user_id').distinct.count
  end

  def num_recent_uniques
    visits
      .select('user_id')
      .where('created_at > ?', 10.minutes.ago)
      .distinct
      .count
  end



end
