class User < ActiveRecord::Base
  # attr_accessible :title, :body
 
  has_many :posts, :foreign_key => "author_id", :order => 'created_at ASC'
  attr_accessor :password
  
  attr_accessible :username, :password, :fname, :lname, :email, :display_name, :user_level
   attr_protected :hashed_password
   
  has_many :recent_posts, :class_name => 'Post', :order => 'created_at ASC', :limit => 5
       
    before_create :before_create
	before_update :before_update
	after_save :after_save
	before_destroy :before_destroy
	
	validates_uniqueness_of :username
	
	def before_create
	  self.salt = User.make_salt(self.username)
    self.hashed_password = User.hash_with_salt(@password, self.salt)
  end
  
	def before_update
	  if !@password.blank?
	  	 self.salt = User.make_salt(self.username) if self.salt.blank?
      self.hashed_password = User.hash_with_salt(@password, self.salt)
    end
  end
  
  def after_save
    @password = nil
  end
  
  def before_destroy
    return false if self.id == 1
  end
  
	def full_name
		self.fname + " " + self.lname
	end
	
	def self.authenticate(username = "", password = "")
    user = self.find(:first, :conditions => ["username = ?", username])
	#pass = user.authenticated(password)
    return(user && user.authenticated(password)) ? user : nil
  end
  
  def authenticated( password = "" ) 			# ? return boolean type
   puts c1 = self.hashed_password
   puts c2 = User.hash_with_salt(password, self.salt)
   if (c1 == c2)
	return true
   else
    return false
  end	
  end
  
  private #----------------
  
   def self.make_salt( string )
	  return Digest::SHA1.hexdigest(string.to_s + Time.now.to_s)
  end
	
  def self.hash_with_salt(password, salt)
    return Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
end
