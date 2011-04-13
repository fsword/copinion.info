class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :openid
      t.datetime :last_visited_at
      t.string :img_path
      t.string :zone

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
