class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :shortened_url
      t.integer :click_counter
      t.belongs_to :user
      t.integer :user_id
    end
  end
end
