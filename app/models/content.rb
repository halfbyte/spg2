class Content < ActiveRecord::Base
  belongs_to :page
  acts_as_list :scope => :page


  def self.implementations
    ['BasicContent','ParsedContent']
  end

end
