require 'thread'

class ThreadPool
  attr_reader :queue, :threads

  def initialize(size)
    @queue = Queue.new
    @threads = []

    size.times do
      @threads << Thread.new do
        catch(:exit) do
          loop do
            job, args = @queue.pop
            job.call(*args)
          end
        end
      end
    end
  end

  def schedule(*args, &block)
    @queue.push([block, args])
  end

  def shutdown
    @threads.size.times do
      schedule { throw :exit }
    end

    @threads.each(&:join)
  end

end
