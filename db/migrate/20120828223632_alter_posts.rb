class AlterPosts < ActiveRecord::Migration
  def up
      rename_table("posts","blog_posts")
	 rename_column("blog_posts","body","content")
	 change_column("blog_posts", "auther", :integer, :default=>0)
	 rename_column("blog_posts", "auther","auther_id")
	 add_index("blog_posts", "auther_id")
  end

  def down
      remove_column("blog_posts", "auther_id")
	  rename_table("blog_posts","posts")
	  rename_column("posts","content","body")
	  rename_column("posts","auther_id","auther")
	  change_column("posts","auther", :string, :limit=>100, :default=>0)
  end
end
