#! /usr/bin/env ruby
class CSSCompressor
  def initialize(filename)
    @filename = filename
  end
  
  def compress_to(dest_file)
    fwrite = File.new(dest_file,"a")
    File.open(@filename,'r') do |fread|
      count = 0
      while line = fread.gets
        if not (line.match(/^\n$/) or line.strip.match(/\/\*.*\*\//))
          fwrite.syswrite(line)
        end
        count = count + 1
      end
      puts count
    end
    fwrite.close
  end
end
