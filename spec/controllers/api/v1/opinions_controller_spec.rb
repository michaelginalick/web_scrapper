# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::OpinionsController, type: :controller do
  describe 'GET #index' do
    let(:invalid_params) { { opinion: 'wow' } }
    let(:valid_params) { { opinion: 'would-gun-control-be-helpful-at-all' } }
    let(:scrapper_response) { JSON.parse(file_fixture('opinion_end_point_response.json').read) }

    context 'invalid params' do
      it 'returns 422 with error messages' do
        get :index, params: {}
        expect(JSON.parse(response.body)['message']).to eq('ParamMissing')
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'gracefully handles when site does not exist' do
        get :index, params: invalid_params
        expect(JSON.parse(response.body)['message']).to eq('404 Not Found')
        expect(JSON.parse(response.body)['status']).to eq(422)
      end
    end

    context 'valid params' do
      before do
        allow(Scrapper::Parse).to receive(:perform) { scrapper_response }
      end

      it 'will return a valid json response' do
        get :index, params: valid_params
        expect(JSON.parse(response.body)).to eq(scrapper_response)
      end

      it 'will return a valid json response with specific keys' do
        get :index, params: valid_params
        expect(JSON.parse(response.body).keys).to eq(%w[title yes_percent no_percent yes_arguments no_arguments])
      end

      it 'will return a 200 response code' do
        get :index, params: valid_params
        expect(response.status).to eq(200)
      end
    end
  end
end
