class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :msg

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
