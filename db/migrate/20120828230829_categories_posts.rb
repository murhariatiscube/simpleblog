class CategoriesPosts < ActiveRecord::Migration
  def up
    #drop_table :categoies_posts
    create_table :categoies_posts, :id=>false do|t|
		 t.integer "category_id"
		 t.integer "post_id"
    end
 
		 add_index("categoies_posts", "category_id")
		 add_index("categoies_posts", "post_id")
		 
    end
  def down
  end
end
