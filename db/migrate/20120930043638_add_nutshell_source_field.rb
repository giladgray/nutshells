class AddNutshellSourceField < ActiveRecord::Migration
  def up
  	change_table :nuts do |t|
  		t.string :source
  		t.string :source_url
  	end
  end

  def down
  	remove_column :nuts, :source
  	remove_column :nuts, :source_url
  end
end
