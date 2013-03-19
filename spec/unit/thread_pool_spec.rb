require_relative "../spec_helper"

describe ThreadPool do

  context "#schedule" do

    it("execute jobs in parallel.") do
      @result = ""
      thread_pool = ThreadPool.new(2)
      thread_pool.schedule { sleep(4); @result = "The 1st job." }
      thread_pool.schedule { sleep(1); @result = "The 2nd job." }
      sleep(2)
      @result.should eq "The 2nd job."
      sleep(3)
      @result.should eq "The 1st job."
    end

  end

end
