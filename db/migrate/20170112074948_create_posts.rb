class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :post_ip_value
      t.string :user_login
      t.integer :rating
      t.integer :count_rating

      t.timestamps null: false
    end
  end
end
