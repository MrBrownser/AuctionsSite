class CreateItembids < ActiveRecord::Migration
  def change
    create_table :itembids do |t|
    	t.float	:amount
    	t.integer :itemauction_id, :user_id
      	t.timestamps null: false
    end
  end
end
