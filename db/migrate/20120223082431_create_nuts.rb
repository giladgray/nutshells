class CreateNuts < ActiveRecord::Migration
  def change
    create_table :nuts do |t|
      t.string :title
      t.string :body
      t.integer :rating

      t.timestamps
    end
  end
end
