# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::ScrapeYesPercentage, type: :service do
  let(:html_page) { file_fixture('opinion.html').read }
  let(:service) { Scrapper::ScrapeYesPercentage.perform(Nokogiri::HTML(html_page)) }
  let(:html_snippet) { "<html><body><class='yes-text'></class></body></html>" }

  describe '.perform' do
    it 'will return the percent of yes votes from the html page' do
      expect(service).to eq('46% Say Yes')
    end

    it 'will return an empty string if the percentage does not exist' do
      expect(Scrapper::ScrapeYesPercentage.perform(Nokogiri::HTML(html_snippet))).to eq('')
    end
  end
end
