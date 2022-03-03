#!/usr/bin/env ruby

require 'fileutils'

test_file = 'inc.dt'

FileUtils.touch(test_file) unless File.exist?(test_file)

(1..10_000).each do |i|
  count = File.read(test_file).to_i
  count += 1

  puts count
  File.write(test_file, count.to_s)
end
