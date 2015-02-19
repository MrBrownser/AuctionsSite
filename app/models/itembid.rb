class Itembid < ActiveRecord::Base
	belongs_to :itemauction
	belongs_to :user

	validates :amount, numericality: true
	validates :itemauction_id, :user_id, presence: true

	validates :bid_cannot_be_made_by_the_item_owning_user

	def bid_cannot_be_made_by_the_item_owning_user
		if self.itemauction.user_id == user_id
			errors.add(:itemauction_id, "Sorry, you can't bid to your own items")
		end
	end
end