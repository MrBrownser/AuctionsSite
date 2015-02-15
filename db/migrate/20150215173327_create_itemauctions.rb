class CreateItemauctions < ActiveRecord::Migration
  def change
    create_table :itemauctions do |t|
    	t.string	:name, :category, :img_link
    	t.text		:description
    	t.date		:end_date
    	t.float		:starting_price, default: 0.00
    	t.integer	:user_id
      	t.timestamps null: false
    end
  end
end
