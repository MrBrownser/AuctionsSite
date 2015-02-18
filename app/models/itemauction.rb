class Itemauction < ActiveRecord::Base
	# The user who created it
	belongs_to :user
	# And also have bidders, so we make the relation
	has_many :bidders, through: :itembids, source: :user

	validates :starting_price, numericality: true
	validates :category, inclusion: { in: ["Collectibles & Art", "Electronics", "Entertainment", "Fashion", "Home & garden", "Motors", "Sporting goods", "Toys & hobbies", "Other category"]}
    validates :name, presence: true
    validates :category, presence: true
    validates :description, presence: true
    validates :end_date, presence: true
    validates :starting_price, presence: true
    validates :user_id, presence: true

	validate :end_date_cannot_be_in_the_past
	# validate :bid_cannot_be_made_by_the_item_owning_user

	def end_date_cannot_be_in_the_past
		if end_date <= Date.today
			errors.add(:end_date, "Auction should last one day at least")
		end
	end
end