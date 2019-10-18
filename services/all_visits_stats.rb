# frozen_string_literal: true

class AllVisitsStats
  attr_reader :data_structure, :all_statistics

  def initialize(data_structure)
    @data_structure = data_structure
    @all_statistics = {}
  end

  def convert
    @data_structure.map do |host, _host_ip|
      if @all_statistics.key?(host)
        @all_statistics[host] += 1
      else
        @all_statistics[host] = 1
      end
    end
  end
end
