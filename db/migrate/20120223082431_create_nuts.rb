class CreateNuts < ActiveRecord::Migration
  def change
    create_table :nuts do |t|
      t.string :title
      t.string :body
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
