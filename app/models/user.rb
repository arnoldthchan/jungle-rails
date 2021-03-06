class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy

  validates_presence_of :first_name, :last_name, :password_confirmation
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.downcase.strip)
    if @user
      @user.authenticate(password)
    else
      nil
    end
  end
end
