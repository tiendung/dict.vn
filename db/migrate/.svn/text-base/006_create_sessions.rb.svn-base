# @author: dinhhai
# 20070716
#
# Purpose: to create table for session

class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions, :options => 'ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.column :session_id, :string, :limit => 254
      t.column :data, :text
      t.column :updated_at, :datetime
    end

    add_index :sessions, :session_id
    add_index :sessions, :updated_at
  end

  def self.down
    drop_table :sessions
  end
end
