class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  belongs_to :company, optional: true
  has_many :bsp_trainings
  has_many :llc_services
  has_many :medications
  has_many :medication_counts
  has_many :mars
  has_many :behaviors

  has_and_belongs_to_many :service_types

  after_create :send_welcome_email
  
  ROLES = {
    super_admin: 'super_admin',
    admin: 'admin',
    staff: 'staff',
    individual: 'individual'
  }

  ROLES.each do |key, val|
    define_method(:"#{key.to_s}?") do
      self.role == val
    end
  end

  def full_name
    [first_name, last_name].join(' ').strip
  end

  private ##

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
