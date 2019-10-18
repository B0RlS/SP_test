# frozen_string_literal: true

class Parser
  attr_accessor :content
  attr_reader :information

  def initialize
    @content = ''
    @information = []
  end

  def file_reader(file_name)
    @content = File.open(file_name).read
  end

  def info_parser
    @content.each_line.each do |line|
      host, host_ip = line.split(' ', 2).map(&:strip)
      array = []
      array << host
      array << host_ip
      @information << array
    end
  end
end
