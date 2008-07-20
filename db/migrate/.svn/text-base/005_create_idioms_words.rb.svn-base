class CreateIdiomsWords < ActiveRecord::Migration
  def self.up
    # hambt relation between words and idioms
    # hambt is short for has_and_belongs_to_many, AWDWR2-page-328
    create_table :idioms_words, :id => false, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.column :idiom_id,       :integer, :null => false
      t.column :word_id,        :integer, :null => false
     end
    # indexes are important for performance if join tables grow big, AWDWR2-page-326
    add_index :idioms_words,  [ :word_id, :idiom_id ]
    add_index :idioms_words,    :idiom_id
  end

  def self.down
    drop_table :idioms_words
  end
end
