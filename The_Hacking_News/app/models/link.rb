class Link < ApplicationRecord
	validates :submitted_link, presence: true
	belongs_to :users
	has_many :comments, :dependent => :destroy
end
