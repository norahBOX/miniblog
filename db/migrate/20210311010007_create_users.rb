class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :username, null: false, default: ""
      t.string :instagram
      t.string :twitter
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
