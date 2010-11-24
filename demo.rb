
# Ruby 1.9.2 seams not add current path for lib search
$: << File.dirname(__FILE__)

require 'client/dnote_connector'

puts "----------- Extract default labels ---------------"
puts DNoteConnector.call(:marker => '#')

puts ""

puts "----------- Extract custom labels ---------------"
puts DNoteConnector.call(:marker => '#',
:labels => ['CoP', 'CoA'])

