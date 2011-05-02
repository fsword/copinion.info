class CreateCcs < ActiveRecord::Migration
  def self.up
    create_table :ccs, :id => false do |t|
      t.integer :user_id
      t.integer :opinion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ccs
  end
end
