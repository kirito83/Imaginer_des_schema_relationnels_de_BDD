class Pin < ApplicationRecord
	validates :img_link, presence: true
	belongs_to :user
	has_many :comment, :dependent => :destroy
end
