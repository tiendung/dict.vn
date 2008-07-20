# put this in your lib folder as logger_format.rb and 
# require it in your environment or an initializer
class Logger
  def format_message(level, time, progname, msg)
    "#{time.to_s(:long)} -- #{msg}\n" 
  end    
end