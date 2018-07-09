# frozen_string_literal: true

class Scrapper::ScrapeYesPercentage
  def self.perform(document)
    document.css('.yes-text').inner_html.strip
  end
end
