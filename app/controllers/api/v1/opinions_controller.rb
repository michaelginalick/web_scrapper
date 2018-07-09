# frozen_string_literal: true

class Api::V1::OpinionsController < ApplicationController
  def index
    raise ParamMissing unless opinion_params[:opinion].present?

    response = Scrapper::Parse.perform(opinion_params[:opinion])

    render json: response, status: :ok
  rescue OpenURI::HTTPError, URI::InvalidURIError, ParamMissing => ex
    render json: { message: ex, status: 422 }
  end

  private

  def opinion_params
    params.permit(:opinion)
  end
end
