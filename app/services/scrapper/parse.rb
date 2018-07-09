# frozen_string_literal: true

class Scrapper::Parse
  BASE_URL = 'http://www.debate.org/opinions/'

  def self.perform(opinion)
    page = new(opinion)
    page.to_hash
  end

  attr_reader :document

  def initialize(opinion)
    url = BASE_URL + opinion
    @document = Nokogiri::HTML(open(url))
  end

  def to_hash
    {
      title: Scrapper::ScrapeTitle.perform(document),
      yes_percent: Scrapper::ScrapeYesPercentage.perform(document),
      yes_arguments:  Scrapper::ScrapeYesArgument.perform(document),
      no_percent: Scrapper::ScrapeNoPercentage.perform(document),
      no_arguments: Scrapper::ScrapeNoArgument.perform(document)
    }
  end
end
