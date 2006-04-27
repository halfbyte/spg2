class CreateBasicContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :page_id, :integer
    add_column :contents, :position, :integer
  end

  def self.down
    remove_column :contents, :page_id
    remove_column :contents, :position
  end
end
