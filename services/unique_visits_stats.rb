# frozen_string_literal: true

class UniqueVisitsStats
  attr_reader :data_structure, :unique_statistics

  def initialize(data_structure)
    @data_structure = data_structure
    @unique_statistics = {}
  end

  def convert
    @data_structure.uniq.map do |host, _host_ip|
      if @unique_statistics.key?(host)
        @unique_statistics[host] += 1
      else
        @unique_statistics[host] = 0
      end
    end
  end
end
