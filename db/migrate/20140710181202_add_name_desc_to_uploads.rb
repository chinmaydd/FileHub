class AddNameDescToUploads < ActiveRecord::Migration
  
  def up
  	add_column :uploads, :name, :string
  	add_column :uploads, :description, :string
  end

  def down
  	remove_column :uploads, :name, :string
  	remove_column :uploads, :description, :string
  end
  
end
