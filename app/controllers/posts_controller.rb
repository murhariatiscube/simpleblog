class PostsController < ApplicationController
	layout 'staff'
	before_filter :authorize_access, :set_archive_list
	#layout 'simple_blog/app/views'
	#require 'D:/simple_blog/app/views/layouts/staff.html.erb'
  def index
    list
    render :action => 'list'
   # show
  #  render :action => 'show'
  # render('list')
 end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  #verify :method => :post, :only => [ :destroy, :create, :update ],
       #  :redirect_to => { :action => :list }

  def list
  #  @post_pages, @posts = paginate :posts, :per_page => 10
    @posts = Post.paginate(:per_page => 1, :page => params[:page])
	
  end
  
 def show
    @post = Post.find(params[:id])
      @all_categories = Category.find(:all, :order => 'name ASC')
      render(:template => 'main/view_post', :layout => 'application')
  end
  alias :view_post :show

    
  def new
    @post = Post.new
    @user_list = get_user_list
    @all_categories=get_all_categories
  end 

  def create
  	post_params=params[:post]
  	auther_id=post_params.delete(:auther_id)
  	 @all_categories=get_all_categories
  	 checked_categories=get_categories_form(params[:categories])
     removed_categories=@all_categories - checked_categories
    @post = Post.new(post_params)
    @post.user=User.find(auther_id)
    if @post.save
    	checked_categories.each{|cat| @post.categories<<cat if !@post.categories.include?(cat)}
    	removed_categories.each{|cat| @post.categories.delete(cat) if @post.categories.include?(cat)}
      flash[:notice] = 'Post was successfully created.'
      #render(:action => 'list')
      redirect_to :action => 'list'
    else
      @user_list = get_user_list
      @all_categories=get_all_categories
      #render :action => 'new'
      
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user_list = get_user_list
     @all_categories=get_all_categories
  end
  
  def update
  	post_params=params[:post]
  	auther_id=post_params.delete(:auther_id)
  	@all_categories=get_all_categories
  	 checked_categories=get_categories_form(params[:categories])
     removed_categories=@all_categories - checked_categories
    
    @post = Post.find(params[:id])
     @post.user=User.find(auther_id) if @post.auther_id != auther_id
    if @post.update_attributes(post_params)
        checked_categories.each{|cat| @post.categories<<cat if !@post.categories.include?(cat)}
    	removed_categories.each{|cat| @post.categories.delete(cat) if @post.categories.include?(cat)}
      flash[:notice] = 'Post was successfully updated.'
      #redirect_to :action => 'list'
      render(:action => 'show', :id => @post.id)
     #render(:action => 'list')
    else
       @user_list = get_user_list	
      render :action => 'edit'
      #render('edit')
    end
  end
  
    def delete
		@post=Post.find(params[:id])
	end	
	

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice]="post deleted"
    redirect_to :action => 'list'
   # redirect_to('list')
  end
  private #----------
  
  def get_user_list
    return User.find(:all, :order => 'lname ASC').collect {|user| [user.full_name, user.id]}
  end
  
  def get_all_categories
  	return Category.find(:all,:order=>'name ASC')
  end	
  
  def get_categories_form(cat_list)
  	cat_list=[] if cat_list.blank?
  	return cat_list.collect {|cid| Category.find_by_id(cid.to_i)}.compact
  end	
  
   def set_archive_list
    posts = Post.find(:all, :conditions => ["status = 'published'"], :order => "created_at DESC")
		@archive_list = posts.collect do |p|
		  [p.created_at.strftime("%b %Y"), p.created_at.year, p.created_at.month]
		end
		@archive_list.uniq!
  end
  
end
