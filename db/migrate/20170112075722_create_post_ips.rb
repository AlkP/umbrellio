class CreatePostIps < ActiveRecord::Migration
  def change
    create_table :post_ips do |t|
      t.string :value
      
      t.references  :user, index: true
      t.references  :post, index: true

      t.timestamps null: false
    end
  end
end
