require_relative 'exercise1/exercise1.rb'
require_relative 'exercise2/exercise2.rb'
require_relative 'exercise3/exercise3.rb'
require_relative 'exercise4/exercise4.rb'
require_relative 'exercise5/exercise5.rb'
require_relative 'exercise6/exercise6.rb'
require_relative 'exercise7/exercise7.rb'

def process number
	$exercises[number].call if number > 0 and number < 8
end


$exercises = []
$exercises[1] = method(:exercise1_start)
$exercises[2] = method(:exercise2_start)
$exercises[3] = method(:exercise3_start)
$exercises[4] = method(:exercise4_start)
$exercises[5] = method(:exercise5_start)
$exercises[6] = method(:exercise6_start)
$exercises[7] = method(:exercise7_start)


process(ARGV[0].to_i) unless ARGV[0].nil? 