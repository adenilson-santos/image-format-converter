require 'rmagick'
require 'byebug'

def get_files
  puts "Initializing..."
  puts "Convertion setup -> RGB(250,250,250) HEX(#FAFAFA) CMKY(0,0,0,2)"
  print "Insert a folder: "
  folder = gets.chomp
  puts ""

  files = Dir.glob("#{folder}/*.png")
  
  if files.length < 1
    puts "** Error: This folder #{folder} don't exists or is empty. **" 
  else
    index = Dir.glob('./go_versa_result*').length == 0 ? 1 : Dir.glob('./go_versa_result*').length.next
    save_folder = "go_versa_result_#{index}"
    
    system("mkdir #{save_folder}") 

    files.each do |file| 
      begin 
        image = Magick::Image.read("#{file}").first
        image.format = 'TIFF'
        image.fuzz = 0
        image = image.opaque('rgba(255,255,255)','rgba(250,250,250)')
        new_image = "#{save_folder}/#{file.split('/').last.gsub('.png', '.tiff')}"
        image.write(new_image)
        
        puts "#{file} has been converted to #{new_image}"
      rescue => e
        puts "Any error ocurred - #{e}"
      end
    end

    puts ""
    puts "Thanks so much. By: Engineering Team <3"
  end
end

get_files