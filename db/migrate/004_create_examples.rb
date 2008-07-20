class CreateExamples < ActiveRecord::Migration
  def self.up
    create_table :examples, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci'  do |t|
      t.column :written_form,   :text
      t.column :explanation,    :text
      t.column :meaning_id,     :integer, :null => false
    end
    add_index :examples,        :meaning_id
  end

  def self.down
    drop_table :examples
  end
end
