class CreateSynants < ActiveRecord::Migration
  def self.up
    create_table :synants, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.column :synonym,   :text
      t.column :antonym,    :text
      t.column :meaning_id,     :integer, :null => false
    end
    add_index :synants,        :meaning_id
  end

  def self.down
    drop_table :synants
  end
end

