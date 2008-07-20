class CreateMeanings < ActiveRecord::Migration
  def self.up
    # one meanings has_many examples
    create_table :meanings, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.column :language,       :string,  :null => false, :limit => 20
      t.column :explanation,    :text,    :null => false
      t.column :part_of_speech, :string, :limit => 50
      t.column :item_id,        :integer, :null => false
    end
    # index item_id to speed up finding item.meanings
    add_index :meanings,        :item_id
  end

  def self.down
    drop_table :meanings
  end
end
