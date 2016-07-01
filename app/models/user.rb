class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}
  has_many :comments
  has_many :matches, :foreign_key => 'user_id', :class_name => "Match"
  has_many :opponents, through: :matches

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence:true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def confirm!
    self.confirmed = true
    save!
  end

  # def pretty_phone_number
  #   phone.phone_formatted(format: :international, spaces: ' ')
  # end

  before_save :default_values
    def default_values
      self.bio ||= 'Tell us about yourself.'
    end

end
