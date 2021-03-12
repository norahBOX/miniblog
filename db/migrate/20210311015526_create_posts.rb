class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
