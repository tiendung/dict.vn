class SpeakController < ApplicationController
  AUDIO_DIR = '/audio/'

  def index
    text = params[:text]
    return unless text
    text = text.to_s
    name = text.gsub(" ","_")
    
    filename = "#{RAILS_ROOT}/public#{AUDIO_DIR}" + name + ".wav"
    filepath = AUDIO_DIR + name + ".wav"
    system("echo \"#{text}\" | text2wave > #{filename} 2> /dev/null") unless File.exists?(filename)  
    
    render :text => "<embed src='#{filepath}' autostart=true width=0 height=0 id='english_pronunciation'>"
  end

end
