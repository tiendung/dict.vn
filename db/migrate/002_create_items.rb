class CreateItems < ActiveRecord::Migration
  def self.up
    # one item is an root entry of a dictionary
    # it's could be a word or an idiom or anything defined in type field
    # using sti AWDWR2-page-344
    # one item has_many meanings
    create_table :items, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.column :written_form,   :string,  :null => false, :limit => 100
      t.column :language,       :string,  :null => false, :limit => 20
      t.column :pronunciation,  :string, :limit => 100
      t.column :type,           :string,  :null => false, :limit => 20
      t.column :source_id,      :integer
    end
    # index to improve query speed while searching an item or an item in a specific langauge
    add_index :items,         [ :language, :written_form ]
    add_index :items,           :written_form
  end

  def self.down
    drop_table :items
  end
end
