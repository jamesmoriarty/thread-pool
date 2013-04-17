thread-pool [![Dependency Status](https://gemnasium.com/jamesmoriarty/thread-pool.png)](https://gemnasium.com/jamesmoriarty/thread-pool)
===========

Ruby thread pool.

```ruby
thread_pool = ThreadPool.new(2)
thread_pool.schedule { "Do something..." }
thread_pool.shutdown
```
