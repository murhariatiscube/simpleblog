class Comment < ActiveRecord::Base
     # attr_accessible :title, :body
     belongs_to :post
   
     attr_accessible :post_id
     attr_accessible :auther
	 attr_accessible :auther_email
	 attr_accessible :Content
	 attr_accessible :status
	 
	 belongs_to :post, :counter_cache=>true
	 	
	validates_presence_of :auther, :auther_email, :Content, :status
	validates_length_of :auther, :within => 3..25
	validates_inclusion_of :status, :in => %w{new approved spam}
	validates_format_of :auther_email, 
	    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	
	def before_validation
	  self.auther.strip!
	  self.auther_email.strip!
	end
	
	private
	
  # The validate method is used for custom validations.
  # Note that it must be a private method.
	def validate
	  # errors.add(:auther, " can't be Kalpesh.") if self.auther == "Kalpesh"
	  errors.add_to_base("John can't be the auther.") if self.auther == "John"
	end
end
