class CreateForwardings < ActiveRecord::Migration
  def self.up
    create_table :forwardings do |t|
      t.string :source
      t.text :destination

      t.timestamps
    end
    add_index :forwardings, :source, :unique => true
  end

  def self.down
    drop_table :forwardings
  end
end
