#!/usr/bin/env ruby
require 'typhoeus'
require 'fileutils'


path = "./tmp/images2.txt"
hydra = Typhoeus::Hydra.new

# Validate HTTPS for ozzieausband.files.wordpress.com
# or follow redirects
# 

IO.foreach(path) do |line|
  url = line.chomp
  filename = url.split('/').last.split('?').first
  path = url.gsub('https://ozzieausband.files.wordpress.com/','/')
    .gsub('https://ozzieausband2.files.wordpress.com/','/')
    .gsub('https://ozzieausband3.files.wordpress.com/','/')
    .split('/')
  path.pop
  pathString = './static/images' + path.join('/') + '/'
  `mkdir -p #{pathString}`
  puts pathString# + filename
  
  # dirname = File.dirname(pathString)
  # puts "dirname: #{dirname}, :? #{File.directory?(dirname)}"
  # unless File.directory?(dirname)
  #   FileUtils.mkdir_p(dirname)
  # end
    
  request = Typhoeus::Request.new(url, followlocation: true)
  request.on_complete do |response|
    if response.success?
      # hell yeah
      File.open("#{pathString}#{filename}", 'wb') { |f| f.write(response.body) }
    elsif response.timed_out?
      # aw hell no
      puts "got a time out: #{url}"
    elsif response.code == 0
      puts "Could not get an http response, something's wrong.: #{url} - #{response.return_message}"
      puts response.return_message
    else
      # Received a non-successful http response.
      puts "HTTP request failed: #{response.code.to_s} - #{url}"
    end
  end
  hydra.queue(request)
end
hydra.run

puts "SUCCESS"

