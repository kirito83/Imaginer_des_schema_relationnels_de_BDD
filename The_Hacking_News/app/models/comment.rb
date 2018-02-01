class Comment < ApplicationRecord
	validates :body, presence: true
	belongs_to :links
	has_many :under_comments, :dependent => :destroy
end
