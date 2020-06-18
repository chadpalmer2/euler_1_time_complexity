require 'pry'

# Stopwatch

def stopwatch(proc, *args)
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    method(proc).call(*args)
    end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed_time = end_time - start_time

    puts "Elapsed time: #{elapsed_time} seconds"
end

# Original

def sum_multiples_original(limit)
    arr = (1..(limit - 1)).select {|n| n % 3 == 0 || n % 5 == 0}
    arr.sum
end

# Improvement

def sum_multiples_improvement(limit)
    (1..(limit - 1)).reduce(0) do |sum, n|
         n % 3 == 0 || n % 5 == 0 ? sum + n : sum
    end
end

# Constant Time

def sum_multiples_constant(limit)
    limit = limit - 1
    3*gauss(limit/3) + 5*gauss(limit/5) - 15*gauss(limit/15)
end

def gauss(n)
    n*(n+1)/2
end


binding.pry
0
