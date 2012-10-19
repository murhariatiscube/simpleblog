class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
	   t.integer "post_id", 		          :default=>0 
	  t.string "auther", 	  :limit=>25 
	  t.string "auther_email",:limit=>50 
	  t.text "Content" 
	  t.string "status",	  :limit=>25 
      t.timestamps
    end
	  add_index("comments", "post_id")
  end
end
