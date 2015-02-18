class User < ActiveRecord::Base
	# User can create new ItemAuctions
	has_many :itemauctions, dependent: :destroy
	# But also can make bids to another ItemAuctions (who didn't create obviously)
	has_many :items_bidded, :through => :itembids, source: :itemauction, dependent: :destroy

	validates :email, presence: true, uniqueness: true
	validates :name, presence: true
end

__END__

Pseudo code for dependency implementation:

class Item
  belongs_to :user
  has_many :bidders, through: :bids, source: :user
end

class User
  has_many :items
  has_many :items_bidded, through: :bids, source: :item

  # def items_bidded
  #   bids = Bid.where(user_id: user_id)
  #   bids.map(:&item)
  # end
end

class Bid
  belongs_to :user
  belongs_to :item

  # def user 
  #   User.find(user_id)
  # end
end