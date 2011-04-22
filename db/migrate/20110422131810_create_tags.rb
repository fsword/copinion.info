class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :opinions_tags, :id => nil do |t|
      t.integer :tag_id
      t.integer :opinion_id
    end
  end

  def self.down
    drop_table :tags
    drop_table :opinions_tags
  end
end
