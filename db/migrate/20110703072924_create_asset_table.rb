class CreateAssetTable < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer  "parent_id"
		  t.string   "content_type"
		  t.string   "filename", :limit=>80
		  t.string   "thumbnail", :limit=>20
		  t.integer  "size"
		  t.integer  "width"
		  t.integer  "height"
		  t.string   "type", :limit=>40
		  t.integer  "user_id"
		  t.integer  "assetable_id"
		  t.string   "assetable_type", :limit=>40

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
