class Page < ActiveRecord::Base
  acts_as_tree :order => 'weight'
  has_many :contents
end
