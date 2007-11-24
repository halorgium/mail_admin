class CreateForwardings < ActiveRecord::Migration
  def self.up
    create_table :forwardings do |t|
      t.integer  "source_domain_id"
      t.string   "source_name"
      t.integer  "destination_account_id"

      t.timestamps
    end
    add_index :forwardings, [:source_domain_id, :source_name], :unique => true
  end

  def self.down
    drop_table :forwardings
  end
end
