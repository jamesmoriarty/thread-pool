# Copyright (c) 2012 James Moriarty
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'thread'

class ThreadPool
  attr_reader :queue, :threads, :size

  def initialize(size)
    @size    = size
    @queue   = Queue.new
    @threads = []
  end

  def start
    size.times do
      threads << Thread.new do
        catch(:exit) do
          loop do
            job, args = queue.pop
            job.call(*args)
          end
        end
      end
    end
  end

  def schedule(*args, &block)
    queue.push([block, args])
  end

  def shutdown
    threads.each do
      schedule { throw :exit }
    end

    threads.each(&:join)
  end

end
