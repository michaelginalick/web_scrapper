# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::ScrapeNoArgument, type: :service do
  let(:html_page) { file_fixture('opinion.html').read }

  describe '.perform' do
    it 'will return an array of No arguments' do
      expect(Scrapper::ScrapeNoArgument.perform(Nokogiri::HTML(html_page))).to be_kind_of(Array)
    end

    it 'will return an array with one element per No argument' do
      expect(Scrapper::ScrapeNoArgument.perform(Nokogiri::HTML(html_page)).length).to eq(10)
    end

    it 'will return an array with each element containing a hash with the same keys' do
      arguments = Scrapper::ScrapeNoArgument.perform(Nokogiri::HTML(html_page))

      arguments.each do |argument|
        expect(argument).to be_kind_of(Hash)
        expect(argument.keys).to include(:paragraph, :posted_by, :like_count, :message_count)
      end
    end
  end
end
