class FixIdiomLinks < ActiveRecord::Migration
  
  def self.idiom_to_str( idiom )
    return "#{idiom.id}:'#{idiom.written_form}'"
  end
  
  def self.change_idioms_words( ref_id, id )
    execute "UPDATE idioms_words SET idiom_id = #{id} WHERE idiom_id = #{ref_id}"
  end
  
  def self.remove_spaces( str )
    return str.delete(" \n")
  end
    
  def self.repair_ref_idiom( ref_idiom )
     
    this = "%" + ref_idiom.written_form + "%"
    idioms = Idiom.find( :all, :conditions => ["written_form LIKE ? ", this ] )

    idioms.each do |idiom|
      begin 
        if not @@ref_ids.include? idiom.id
          puts "change from #{idiom_to_str(ref_idiom)} to #{idiom_to_str(idiom)}"
          change_idioms_words( ref_idiom.id, idiom.id )
          return true
        end
      rescue => e
        puts e
      end
    end     
    
    @@idioms.each do |idiom|
      begin 
        if not @@ref_ids.include? idiom.id and remove_spaces( ref_idiom.written_form ) == remove_spaces( idiom.written_form )
          puts "change from #{idiom_to_str(ref_idiom)} to #{idiom_to_str(idiom)}"
          change_idioms_words( ref_idiom.id, idiom.id )
          ref_idiom.delete
          return true
        end
      rescue => e 
        puts e
      end
    end
    
    return false
  end
  
  
  def self.up
    @@idioms = Idiom.find( :all )
    @@ref_ids = []
    
    ref_meanings = Meaning.find( :all, :conditions => ["explanation LIKE ?", "%(xem)%"] )
    ref_idioms = []
    
    ref_meanings.each do |meaning|
      begin
        item = meaning.item
        if item.type == 'Idiom' and not @@ref_ids.include? item.id
          ref_idioms << item
          @@ref_ids << item.id
        end
      rescue => e
        puts e
      end
    end
    
    ref_idioms = ref_idioms.sort_by { |idiom| idiom.written_form }
    
    count = 0
    ref_idioms.each do |idiom|
      begin 
        count += 1
        puts "repairing ##{count} .."
        puts idiom_to_str( idiom )
        puts "can't find original one" if not repair_ref_idiom( idiom )
        puts
      rescue => e
        puts e
      end
    end
  end

  def self.down
  end
  
end
