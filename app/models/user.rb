class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  before_create :set_role

  private

  def set_role
  	if User.first.present?
  		self.role ||= Role.find_by_name('admin')
  	else
  		self.role ||= Role.find_by_name('user')
  	end
  end

end