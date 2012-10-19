class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	   t.string "username", 		:limit=>25
	  t.string "hashed_password",   :limit=>40
	  t.string "fname", 			:limit=>25
	  t.string "lname", 			:limit=>40
	  t.string "email", 			:limit=>50
	  t.string "display_name",		:limit=>25
	  t.integer "user_level", 		:limit=>3,  :default=>0 
      t.timestamps
    end
  end
end
