class Cour < ApplicationRecord
	has_many :students, :dependent => :destroy
	validates :title, presence: true
end
