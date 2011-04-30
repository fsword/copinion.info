class CreateFollowings < ActiveRecord::Migration
  def self.up
    create_table :followings, :id => false do |t|
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
  end

  def self.down
    drop_table :followings
  end
end
