class User < ApplicationRecord

  has_one :account, as: :accountable
  has_many :user_shows
  has_many :shows, through: :user_shows
  has_many :user_bands
  has_many :bands, through: :user_bands

  accepts_nested_attributes_for :shows

  def self.from_facebook(auth)
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      @upass = Sysrandom.hex(32)
      u.password = @upass
      u.password_confirmation = @upass
    end
    log_in(@user)
    redirect_to user_path
  end

  def name
    self.account.username
  end

  def email
    self.account.email
  end


end
