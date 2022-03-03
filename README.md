# distributed-lock-test

Repository test setup for distributed lock testing.

For general concepts read blog post at [here](https://www.joyfulbikeshedding.com/blog/2021-05-19-robust-distributed-locking-algorithm-based-on-google-cloud-storage.html).

I've tested [distributed-lock-google-cloud-storage-ruby](https://github.com/FooBarWidget/distributed-lock-google-cloud-storage-ruby) implementation and it works fine.

## Test Notes

When you run `unlocked.rb` with two different processes at the same time `inc.dt` file won't have total count. Without any lock it doesn't work as expected.

`locked.rb` is locked implementation of the same test. When you run with two different processes the value `inc.dt` will be sum of two iterations.

Requirements:

- `gem install distributed-lock-google-cloud-storage`
- Set your Google Cloud Bucket as `bucket_name` in `locked.rb`.
- Set your credentials .json file as `cloud_storage_options` in `locked.rb`.
