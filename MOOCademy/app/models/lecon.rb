class Lecon < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true
	belongs_to :cour
end
