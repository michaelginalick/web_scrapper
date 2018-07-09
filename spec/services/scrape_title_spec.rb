# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::ScrapeTitle, type: :service do
  let(:html_page) { file_fixture('opinion.html').read }

  let(:service) { Scrapper::ScrapeTitle.perform(Nokogiri::HTML(html_page)) }
  let(:html_snippet) { "<html><body><class='q-title'></class></body></html>" }

  describe '.perform' do
    it 'will return the title of the html document' do
      expect(service).to eq('Would gun control be helpful at all?')
    end

    it 'will return an empty string if the title is not present' do
      expect(Scrapper::ScrapeTitle.perform(Nokogiri::HTML(html_snippet))).to eq('')
    end
  end
end
