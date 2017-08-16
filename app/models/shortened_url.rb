class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, presence: true 
end
