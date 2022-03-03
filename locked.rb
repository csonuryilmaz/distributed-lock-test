#!/usr/bin/env ruby

require 'distributed-lock-google-cloud-storage'
require 'fileutils'

test_file = 'inc.dt'

logger = Logger.new($stderr)
logger.level = Logger::WARN

lock = DistributedLock::GoogleCloudStorage::Lock.new(
  bucket_name: 'autoscaling-lock',
  path: 'locks/mywork',
  cloud_storage_options: {
    credentials: 'autoscaletest-342212-0c209fda57a1.json'
  },
  logger: logger
)

FileUtils.touch(test_file) unless File.exist?(test_file)

(1..250).each do |_i|
  lock.synchronize do
    count = File.read(test_file).to_i
    count += 1

    puts count
    File.write(test_file, count.to_s)

    # IMPORTANT: _periodically_ call this!
    lock.check_health!
  end
end
