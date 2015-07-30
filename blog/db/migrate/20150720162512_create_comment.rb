class CreateComment < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :user
  		t.string :content
  		t.integer :post_id
  	end
  end
end
