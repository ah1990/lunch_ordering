class FirstCourseItem < ActiveRecord::Base
	belongs_to :menu

	validates :name, presence: true
	validates :price, presence: true
end