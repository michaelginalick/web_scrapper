# frozen_string_literal: true

class Scrapper::ScrapeYesArgument < Scrapper::ScrapeBase
  def self.perform(document)
    yes_arguments = []

    document.css('#yes-arguments').css('.hasData').each do |argument|
      yes_arguments += [{ paragraph: concat_strings(argument.css('h2').inner_html, argument.css('p').inner_html),
                          posted_by: posted_by(argument),
                          like_count: like_count(argument),
                          message_count: message_count(argument) }]
    end
    yes_arguments
  end
end
