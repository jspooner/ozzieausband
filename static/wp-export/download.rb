#!/usr/bin/env ruby


IO.foreach("jpgs.txt") do |line|
  puts `curl -OL -s #{line}`
end