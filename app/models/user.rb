class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true,uniqueness: true, format: /\D.*@*.com/
    validates :password, presence: true, length: {minimum: 8, maximun: 15}
    validates :confirm_password, presence: true, length: {minimum: 8, maximun: 15}
    validates :mobile, presence: true, length: {is: 10}, numericality: {only_integer: true}
    has_one :image
    accepts_nested_attributes_for :image
    has_and_belongs_to_many :subjects
    def self.authenticate(email,password)
      @user = User.where(email: email, password: Digest::MD5.hexdigest(password))
      if not @user.blank?
          @user.first
      else
          nil
      end
    end
    before_create :encrypt_password
    before_validation :pswrd_and_cnfrm_pswrd
    
    def encrypt_password
      self.password = Digest::MD5.hexdigest(password)
      self.confirm_password = Digest::MD5.hexdigest(confirm_password)
    end
    
    def pswrd_and_cnfrm_pswrd
      if password!=confirm_password
        errors.add(:base,"password and confirm_password are not equal")
      end
    end
end
