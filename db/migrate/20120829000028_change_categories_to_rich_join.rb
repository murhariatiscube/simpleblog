class ChangeCategoriesToRichJoin < ActiveRecord::Migration
  def up
       
       #rename_table("categoies_posts","categories_posts")
      # add_column("categories_posts", "id", :primary_key)
	  # remove_column("blog_posts","categery")
  end

  def down
      add_column("blog_posts","categery")
	  remove_column("categories_posts", "id")
	  rename_table("categories_posts","categoies_posts")
  end
end
