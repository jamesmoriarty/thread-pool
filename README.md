thread-pool
===========

Ruby thread pool.

```ruby
thread_pool = ThreadPool.new(2)
thread_pool.schedule { "Do something..." }
thread_pool.shutdown
```
