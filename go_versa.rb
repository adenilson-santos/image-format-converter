def get_files
  puts "Initializing..."
  files = Dir.glob("go_versa_png/*.png")

  folder = Dir.glob("go_versa_tiff")
  system("mkdir go_versa_tiff") if folder.length < 1

  files.each do |file| 
    new_file = file.split('/').last.gsub('.png', '.tiff')
    system("convert #{file} -fuzz 0% -fill 'RGB(250,250,250)' -opaque 'RGB(255,255,255)' go_versa_tiff/#{new_file.gsub('.png', '.tiff')}") 
    puts "#{file} has been converted. ~ format TIFF and CMYK (0,0,0,2)"
  end

  puts "Thanks so much. By: Engineering Team <3"
end

get_files