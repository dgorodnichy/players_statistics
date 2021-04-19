require 'csv'
require 'table_print'
require 'optparse'
require './store'
require './players'

# table_print settings
tp.set :max_width, 100

# process cli arguments
args = {}
OptionParser.new do |opts|
  opts.on('-f FILE', '--file', String)
  opts.on('-y YEAR', '--year', Integer)
  opts.on('-t TEAM', '--team', String)
end.parse!(into: args)

# call code that calculate statistics and print table
path_to_file = args.delete(:file)
if File.exist?(path_to_file)
  store = Store.new(path_to_file)
  tp(Players.new(store.players, args).statistics)
else
  puts 'Invalid path to file'
end
