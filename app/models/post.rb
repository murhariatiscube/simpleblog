class Post < ActiveRecord::Base
	
	self.table_name='blog_posts'
  attr_accessible :title, :content, :auther_id, :status, :comments_count,:created_at
  
  #belongs_to :users
  belongs_to :user, :foreign_key=>'auther_id'
  has_many :comments, :order=>'created_at ASC', :dependent=>:destroy
  has_many :approved_comments,:class_name=>'Comment', :conditions=>"comments.status='approved'"
  has_many :categorizations
  has_many :categories, :through=> :categorizations
  
  validates_presence_of :title, :content, :status
	validates_uniqueness_of :title
	validates_length_of :title, :minimum => 4
	validates_inclusion_of :status, :in => %w{draft published}
 
   @post=Post.new
  Post.find(:all).each do |post|
  	     @post = post
  		current_count=@post.comments.length
  		#puts current_count
  		@post.update_attributes(:comments_count=>current_count)
  		# puts post.comments_count
  		#post.save
  		
  end
  	self.table_name='blog_posts'
  	
  	
  	# line no 9 work like down line's
  	#def approved_comments
  		#self.comments.find(:all, :conditions=>"status='approved'")
   # end
  
end

 