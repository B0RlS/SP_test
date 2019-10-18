require_relative 'services/parser'
require_relative 'services/unique_visits_stats'
require_relative 'services/all_visits_stats'
require_relative 'services/printer'

content = Parser.new
content.file_reader(ARGV[0])
content.info_parser
statistics1 = AllVisitsStats.new(content.information)
statistics1.convert
statistics2 = UniqueVisitsStats.new(content.information)
statistics2.convert
results_all_statistics = Printer.new(statistics1.all_statistics)
results_unique_statistics = Printer.new(statistics2.unique_statistics)

puts 'All visits statistic ( host --- number of visits ):'
results_all_statistics.show_formatted_statistics
puts "\nUnique visits statistic ( host --- number of unique visits ):"
results_unique_statistics.show_formatted_statistics
