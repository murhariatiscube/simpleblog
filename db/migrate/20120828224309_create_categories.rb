class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
	  t.string "name", :limit=>50
	  t.string "short_name", :limit=>30
	  t.string "description"
      t.timestamps
    end
	
  end
end
