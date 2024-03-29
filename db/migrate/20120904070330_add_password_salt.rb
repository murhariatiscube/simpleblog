class AddPasswordSalt < ActiveRecord::Migration
  def up 
   add_column("users", "salt", :string, :limit=>40)
   users = User.find(:all)
   users.each do |user|
   user.password = user.hashed_password
   user.save
  end
  end

  def down
    remove_column("users","salt")
  end
end
