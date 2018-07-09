# frozen_string_literal: true

class Scrapper::ScrapeTitle
  def self.perform(document)
    document.css('.q-title').inner_html
  end
end
