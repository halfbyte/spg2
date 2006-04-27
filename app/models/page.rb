class Page < ActiveRecord::Base
  acts_as_tree :order => 'weight'
end
