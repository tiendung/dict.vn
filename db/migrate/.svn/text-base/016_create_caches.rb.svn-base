class CreateCaches < ActiveRecord::Migration
  def self.up
    create_table :caches do |t|
      t.column :written_form, :string
      t.column :json, :text
    end
  end

  def self.down
    drop_table :caches
  end
end
