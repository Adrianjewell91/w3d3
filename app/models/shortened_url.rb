class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create_and_generate(user, long_url)
    ShortenedUrl.create!(user_id: user.id,
                        long_url: long_url,
                        short_url: self.random_code)
  end

end
