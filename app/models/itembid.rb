class Itembid < ActiveRecord::Base
	belongs_to :itemauction
	belongs_to :user

	validates :amount, numericality: true
end
