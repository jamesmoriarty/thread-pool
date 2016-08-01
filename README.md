thread-pool [![Build Status](https://travis-ci.org/jamesmoriarty/thread-pool.png?branch=master)](https://travis-ci.org/jamesmoriarty/thread-pool) [![Dependency Status](https://gemnasium.com/jamesmoriarty/thread-pool.png)](https://gemnasium.com/jamesmoriarty/thread-pool) [![Coverage Status](https://coveralls.io/repos/jamesmoriarty/thread-pool/badge.png?branch=master)](https://coveralls.io/r/jamesmoriarty/thread-pool) [![Code Climate](https://codeclimate.com/github/jamesmoriarty/thread-pool.png)](https://codeclimate.com/github/jamesmoriarty/thread-pool)
===========

Ruby thread pool.

```ruby
thread_pool = ThreadPool.new(2)
thread_pool.schedule { "Do something..." }
thread_pool.start
thread_pool.shutdown
```
