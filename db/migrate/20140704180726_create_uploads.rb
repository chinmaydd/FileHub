class CreateUploads < ActiveRecord::Migration
  
  def up
    create_table :uploads do |t|
      t.integer "no_of_downloads", :default => 0, :null => false
      t.integer "user_id", :null => false
      t.timestamps
    end
    add_index("uploads", "user_id")
  end

  def down
  	drop_table :uploads
  end

end
