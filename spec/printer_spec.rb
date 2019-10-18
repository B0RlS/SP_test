# frozen_string_literal: true

require 'rspec'
require_relative '../services/parser'
require_relative '../services/unique_visits_stats'
require_relative '../services/printer'

RSpec.describe Printer do
  let(:correct_file_path) { 'spec/fixtures/file/correct_file_with_unique_data.log' }
  let(:parser) { Parser.new }
  let(:correct_statistics) { { '/help_page/1' => 1, '/contact' => 1} }
  before do
    parser.file_reader(correct_file_path)
    parser.info_parser
  end
  let(:unique_converter_obj) { UniqueVisitsStats.new(parser.information) }

  before do
    unique_converter_obj.convert
  end
  subject { described_class.new(unique_converter_obj.unique_statistics) }

  context 'when format_transducer is valid' do
    it 'creates format_transducer instance without errors' do
      expect { subject }.to_not raise_error
    end
  end

  context 'when format_transducer statistics are transformed' do
    it 'is not empty' do
      expect(subject.statistics.empty?).not_to eq(true)
    end
  end
end
