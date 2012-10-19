class Category < ActiveRecord::Base
     # attr_accessible :title, :body
	 
	 has_many :categorizations
	 has_many :posts, :through => :categorizations
	 
     attr_accessible :name
     attr_accessible :short_name
     attr_accessible :description
end
