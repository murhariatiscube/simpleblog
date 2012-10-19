class AddCommentCounter < ActiveRecord::Migration
  def up
     remove_column("blog_posts","comments_count")
	 add_column("blog_posts", "comments_count", :integer, :limit=>4, :default =>0)
    
  end

  def down
	 remove_column("blog_posts","comments_count")
  end
end
