class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :surname, :phone, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email encrypted_password id id_value midname name phone remember_created_at reset_password_sent_at reset_password_token
       surname updated_at]
  end
end
