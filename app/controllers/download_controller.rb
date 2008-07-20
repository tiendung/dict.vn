#require "utils.rb"

class DownloadController < ApplicationController
  
  # @author Dang Khoa + Dinh Hai
  def index    
    # example call : http://localhost:3000/download?url=google.com/     
    session_id = session.session_id
    url = params[:url]     
    dest =  "#{RAILS_ROOT}/public/data/" + session_id 
    download_website(url, dest)    
    
    filePath = dest + "/index.html"
    tempPath = dest + "/temp.html"    
    if File.exist?(filePath) 
      status = "pass" 
    else 
      status = "failed"
    end

    new_file = File.new(tempPath,  "w+")
    new_file.puts '<script type="text/javascript" src="../../javascripts/utilities.js"> 
      </script><script type="text/javascript" src="../../javascripts/jquery.js"></script> 
      <script type="text/javascript" src="../../javascripts/ajaxian/clickandsee.js"></script>'   
    new_file.close
    my_file = File.new(tempPath, File::APPEND|File::RDWR, 0644)
    open_file = File.new(filePath, "r")
      
    while (line = open_file.gets)
       my_file.puts "#{line}"
    end
    
    open_file.close
    my_file.close
    File.delete(filePath)
    File.rename(dest + "/temp.html", dest + "/index.html")
                 
    render :text => "{download: '#{status}', session: '#{session_id}'}", :type => "text/javascript"
  end
  
   # @author Dinh Hai
  def download_website (url, dest)
    logger.info("Downloading website. URL =  " + url)
    begin
      Dir.foreach(dest){|fname| File.delete(dest + "/" + fname) if fname != "." && fname != ".."}
 
      agent = "-U=\"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1\""
      system("#{RAILS_ROOT}/data/wget.exe   --no-check-certificate " + agent + " -E -nd  -k  -P " + dest + " " + url)
      Dir.foreach(dest){|fname| File.rename(dest + "/" + fname, dest + "/index.html") if File.extname(fname) == ".html"}   
    rescue => e
      logger.error("Exception in downloading website: " + e)
    end
  end

end