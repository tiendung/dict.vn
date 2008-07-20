# 20070511
# dangkhoa3002@gmai.com
#-------------------------------------------------------------------
# Convert Js of Thieungu to Min if in production mode 
# and switch to normal in development mode
# using jsmin.rb
#-------------------------------------------------------------------

require "find"
RAILS_ROOT = "../../"

def listfiles(dir)
  list = []
  
  Find.find(dir) do |path|
	
	Find.prune if [".",".."].include? path
	list << path if (!path.index(".svn") && !File.directory?(path))
  end
  list
  return list
end

def readindex ( filepath ) 
	content = File.open(filepath,"r")
	counter = 0
	startLine = 0
	endLine = 0
	
	IO.foreach(filepath) do |line|
		
		if line.index("<!-- Thieu Ngu Javascript start -->")
			startLine = counter
			
		end
		if line.index("<!-- Thieu Ngu Javascript end -->")
			endLine = counter	
		end
		counter = counter + 1
	end
	
	counter = 0
	jsList = []
	IO.foreach(filepath) do |line|
		
		if counter > startLine && counter < endLine && line.strip != ""
			str = line.split
			# puts str[2]
			pos1 = str[2].index("\"")
			pos2 = str[2].rindex("\"")
					
			jsList << File.basename(str[2][pos1 + 1, pos2 - 5])
		end
		counter = counter + 1
	end
	return jsList
end

def createCompressedJs (pathList, jsList)
	
	if File.exists?("#{RAILS_ROOT}/public/javascripts/thieungu_1_0_0/Tn_All.js")
		File.delete("#{RAILS_ROOT}/public/javascripts/thieungu_1_0_0/Tn_All.js") 
	end
	
	if File.exists?("#{RAILS_ROOT}/public/javascripts/thieungu_1_0_0/Tn_Min.js")
		File.delete("#{RAILS_ROOT}/public/javascripts/thieungu_1_0_0/Tn_Min.js") 
	end
	
	newCompressedJs = File.new("#{RAILS_ROOT}/public/javascripts/thieungu_1_0_0/Tn_All.js", "w")
	
	jsList.each do |js|
		pathList.each do |path|
			if path.index(js)
							
				IO.foreach(path) do |line|
					newCompressedJs.puts(line)
				end
			end
		end
	end
	newCompressedJs.close
	
	system("ruby jsmin.rb < ../../public/javascripts/thieungu_1_0_0/Tn_All.js > ../../public/javascripts/thieungu_1_0_0/Tn_Min.js \"Thieu Ngu All Rights Reserve Copyrights 2007\"")
end

list = listfiles("#{RAILS_ROOT}/public/javascripts/thieungu_1_0_0/")
jsList = readindex("#{RAILS_ROOT}/app/views/dict/index.rhtml")
createCompressedJs(list, jsList)

 
# p list