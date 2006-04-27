class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      # t.column :name, :string
      t.column :title, :string, :null => false
      t.column :body, :text
      t.column :type, :string
    end
  end

  def self.down
    drop_table :contents
  end
end
