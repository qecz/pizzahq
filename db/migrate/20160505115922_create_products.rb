class CreateProducts < ActiveRecord::Migration
  def change
	  	create_table :products do |t|
  		t.string :title
  		t.text :description
  		t.text :price
  		t.text :size
  		t.text :weight
  		t.boolean :is_veg
  		t.boolean :is_best_offer
  		t.string :path_to_image 	
  		t.timestamps	
  end
end

