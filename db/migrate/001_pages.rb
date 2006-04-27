class Pages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      # sortierung, acts as tree
      t.column :parent_id, :integer, :null => true
      # gewicht für sortierung innerhalb eines parentnodes
      t.column :weight, :integer, :null => true
      
      t.column :title, :string, :null => false
      t.column :navititle, :string, :null => true
      
      # --- meta ---
      # freigabe
      t.column :starting_at, :datetime, :false => true
      t.column :ending_at, :datetime, :false => true
      t.column :status, :integer, :false => true
      # allgemeines
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      # render-kontrolle
      t.column :rendered_at, :datetime, :null => true
    end
  end

  def self.down
  end
end
