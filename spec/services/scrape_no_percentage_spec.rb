# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::ScrapeNoPercentage, type: :service do
  let(:html_page) { file_fixture('opinion.html').read }
  let(:service) { Scrapper::ScrapeNoPercentage.perform(Nokogiri::HTML(html_page)) }
  let(:html_snippet) { "<html><body><class='no-text'></class></body></html>" }

  describe '.perform' do
    it 'will return the percent of no votes from the html page' do
      expect(service).to eq('54% Say No')
    end

    it 'will return an empty string if the percentage does not exist' do
      expect(Scrapper::ScrapeNoPercentage.perform(Nokogiri::HTML(html_snippet))).to eq('')
    end
  end
end
