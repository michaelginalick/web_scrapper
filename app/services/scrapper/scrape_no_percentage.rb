# frozen_string_literal: true

class Scrapper::ScrapeNoPercentage
  def self.perform(document)
    document.css('.no-text').inner_html.strip
  end
end
