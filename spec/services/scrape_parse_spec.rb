# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::Parse, type: :service do
  let(:scrapper_response) { file_fixture('opinion_end_point_response.json').read }
  let(:html_page) { file_fixture('opinion.html').read }

  describe 'base url' do
    it 'will return the correct url' do
      expect(Scrapper::Parse::BASE_URL).to eq('http://www.debate.org/opinions/')
    end
  end

  describe '.to_hash' do
    before do
      allow(Scrapper::Parse).to receive(:perform) { scrapper_response }
      allow_any_instance_of(Scrapper::Parse).to receive(:to_hash).and_return(scrapper_response)
    end

    it 'will return a hash with the correct keys' do
      expect(JSON.parse(scrapper_response).keys).to eq(%w[title yes_percent no_percent yes_arguments no_arguments])
      Scrapper::Parse.perform('opinion')
    end
  end
end
