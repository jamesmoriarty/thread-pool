require_relative "../spec_helper"

describe ThreadPool do

  context "#schedule" do
    it("execute jobs in parallel.") do
      string = ""
      thread_pool = ThreadPool.new(2)
      thread_pool.schedule { sleep(4); string = "The 1st job." }
      thread_pool.schedule { sleep(1); string = "The 2nd job." }
      sleep(2)
      string.should eq "The 2nd job."
      sleep(3)
      string.should eq "The 1st job."
    end
  end

  context "#shutdown" do
    it("not complete and more jobs.") do
      string = ""
      thread_pool = ThreadPool.new(2)
      thread_pool.schedule { sleep(1); string = "The 2nd job." }
      thread_pool.shutdown
      thread_pool.schedule { sleep(1); string = "The 2nd job." }
      sleep(2)
      thread_pool.queue.size.should eq 1
    end
  end

end
