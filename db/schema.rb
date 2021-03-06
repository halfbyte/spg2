# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 3) do

  create_table "contents", :force => true do |t|
    t.column "title", :string, :default => "", :null => false
    t.column "body", :text
    t.column "type", :string
    t.column "page_id", :integer
    t.column "position", :integer
  end

  create_table "pages", :force => true do |t|
    t.column "parent_id", :integer
    t.column "weight", :integer
    t.column "title", :string, :default => "", :null => false
    t.column "navititle", :string
    t.column "starting_at", :datetime
    t.column "ending_at", :datetime
    t.column "status", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "rendered_at", :datetime
  end

end
