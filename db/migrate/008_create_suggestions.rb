class CreateSuggestions < ActiveRecord::Migration
  def self.up
    create_table :suggestions, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci'  do |t|
      t.column :written_form,   :string,  :null => false, :limit => 100
      t.column :item_id,        :integer, :null => false
      t.column :summary,        :string
    end
    add_index :suggestions,   :written_form
    add_index :suggestions,   :item_id

  end

  def self.down
    drop_table :suggestions
  end
end
