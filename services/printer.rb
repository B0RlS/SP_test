# frozen_string_literal: true

class Printer
  attr_reader :statistics

  def initialize(statistics)
    @statistics = statistics
  end

  def show_formatted_statistics
    @statistics = sort_by_visits(@statistics)
    @statistics.each do |host, visits|
      output_information(host, visits)
    end
  end

  private

  def sort_by_visits(statistics)
    statistics.sort_by { |_host, visits| visits }.reverse.to_h
  end

  def output_information(host, visits)
    puts "#{host}  ---  #{visits} visits"
  end
end
