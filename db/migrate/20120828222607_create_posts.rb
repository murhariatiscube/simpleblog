class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	  t.string "title", 		:limit=>100 
		t.text "body"
		t.string "auther", 		:limit=>100
		t.string "categery", 	:linit=>20
		t.string "status", 		:limit=>20
      t.timestamps
    end
  end
end
