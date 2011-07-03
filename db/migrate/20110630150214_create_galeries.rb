class CreateGaleries < ActiveRecord::Migration
  def self.up
    create_table :galeries do |t|
      t.integer :user_id
      t.text :picture_title
      t.text :description
      
      t.timestamps
    end
  end

  def self.down
    drop_table :galeries
  end
end
