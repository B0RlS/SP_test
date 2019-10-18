require 'rspec'
require_relative '../services/parser'

RSpec.describe Parser do
  subject { described_class.new }

  let(:correct_file_path) { 'spec/fixtures/file/correct_file.log' }
  let(:empty_file_path) { 'spec/fixtures/file/empty_file.log' }
  let(:correct_file_content) { File.open(correct_file_path).read }
  let(:correct_parsing_content) do
    [%w[/help_page/1 722.247.931.582],
     %w[/contact 184.123.665.067],
     %w[/home 316.433.849.805]]
  end

  context 'when successful file actions' do
    it 'correct file reading' do
      expect(subject.file_reader(correct_file_path)).to eq(correct_file_content)
    end
  end

  context 'when wrong file actions' do
    it 'file is empty' do
      subject.file_reader(empty_file_path)
      expect(subject.content).to eq('')
    end

    it 'content is empty' do
      subject.file_reader(empty_file_path)
      expect(subject.info_parser).to eq('')
    end
  end

  context 'when successful file content parsing' do
    before do
      subject.file_reader(correct_file_path)
      subject.info_parser
    end

    it 'return correctly formatted information' do
      expect(subject.information).to eq(correct_parsing_content)
    end
  end
end
