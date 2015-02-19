class Itembid < ActiveRecord::Base
	belongs_to :itemauction
	belongs_to :user

	validates :amount, numericality: true
	validates :itemauction_id, :user_id, presence: true
end
