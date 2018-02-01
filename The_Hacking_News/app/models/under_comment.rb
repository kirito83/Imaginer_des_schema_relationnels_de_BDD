class UnderComment < ApplicationRecord
	validates :body, presence: true
	belongs_to :comments
end
