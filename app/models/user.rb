class User < ActiveRecord::Base
	has_many :itemauctions, dependent: :destroy
	has_many :itembids, dependent: :destroy

	validates :email, presence: true, uniqueness: true
	validates :name, presence: true
end
