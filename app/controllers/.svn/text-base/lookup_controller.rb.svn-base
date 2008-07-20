# 20070621
# @Author: 
# Nguyen Tien Dung (dungtn@gmail.com)
# Nguyen Dinh Hai (nguyendinhhai@gmail.com)
#
# This is a demo place of backend team to test
# basic functionalities such as: dict look up, session, word suggestion, ajax dropdown box.
#

require "spell_corrector"

class LookupController < ApplicationController
  auto_complete_for :suggestion, :written_form, :limit => 10

  def found_word
    @json_string != "not found"
  end

  # @author: dungtn, dinhhai
  # starting page of lookup controller
  def index
    @written_form = params[:suggestion] && params[:suggestion][:written_form]
    @json_string = @written_form && Word.lookup( @written_form )
    
    # session and suggestion words
    if found_word
      @wordlist = add_to_wordlist( @written_form )
      @related_word_list = nil 
    else
      @wordlist = find_wordlist      
      if @written_form != nil
  	    @wordlist = find_wordlist        	    
  	    @related_word_list = correct @written_form
	    end
    end    
  end

  #@author: dinhhai
  #get recent words in session
  def find_wordlist
    session[:wordlist] ||= Wordlist.new
  end
  
  def construct_wordlist_json
    
    wordList = find_wordlist()
    @word.meanings.each do |meaning|
      if (meaning.examples.size != 0)
         arrayOfWordMeanings += "{ \"id\": " + meaning.id.to_s + ", " + "\"text\": " + "\"" + meaning.explanation.gsub(/"/, "'") + "\", \"leaf\": false, qtip: \"" + build_quick_tips_for_word_meaning( meaning.id ) + "\", icon: \"" + retrieve_part_of_speech_image(meaning) + "\"},"
      else
         arrayOfWordMeanings += "{ \"id\": " + meaning.id.to_s + ", " + "\"text\": " + "\"" + meaning.explanation.gsub(/"/, "'") + "\", \"leaf\": true, qtip: \"" + build_quick_tips_for_word_meaning( meaning.id ) + "\", icon: \"" + retrieve_part_of_speech_image(meaning)+ "\"},"
  
      end
    end
        
  end
  
  #@author: dinhhai
  #to keep list of recent word in session  
  def add_to_wordlist(word)
    @wordlist = find_wordlist
    @wordlist.add_word(word)
    return @wordlist
  end
  
  # @author: dangkhoa
  # This is to help look up pronunciation of a word
  def lookup_pronunciation
    input_word = params[:word].downcase
    @word = Word.find( :first, :conditions => ["written_form = ?", input_word ] )
    
    if (@word == nil)
      render :text => "{ written_form: \"" + input_word + "\", pronunciation: \"" + "" + "\" }"
    else
      render :text => @word.get_simple_json, :type => "text/javascript"
    end
  end
  # end lookup_pronunciation
    
end

# rewrite rails auto_complete_for method to increase speed
module ActionController
  module Macros
    module AutoComplete
      module ClassMethods
        def auto_complete_for(object, method, options = {})
          define_method("auto_complete_for_#{object}_#{method}") do
            find_options = { 
              :conditions => [ "LOWER(#{method}) LIKE ?", params[object][method].downcase + '%' ], 
              :order => "#{method} ASC",
              }.merge!(options)
            @items = object.to_s.camelize.constantize.find(:all, find_options)
            render :inline => "<%= auto_complete_result @items, '#{method}' %>"
          end
        end
      end
    end
  end
end
