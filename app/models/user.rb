class User < ApplicationRecord
	has_one :doctor, dependent: :destroy
	has_one :review
	validates_presence_of :first_name, :Last_name, :username, :address, :date_of_birth, :contact_number, :address, :gender, :user_type
	validates_uniqueness_of :username, :contact_number
	enum gender: [ :male, :female, :others]
	enum user_type: [:doctor, :patient]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
