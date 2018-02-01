class Cour < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	has_many :lecon, :dependent => :destroy
end
