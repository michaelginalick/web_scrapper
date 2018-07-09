# frozen_string_literal: true

class Scrapper::ScrapeNoArgument < Scrapper::ScrapeBase
  def self.perform(document)
    no_arguments = []

    document.css('#no-arguments').css('.hasData').each do |argument|
      no_arguments += [{ paragraph: concat_strings(argument.css('h2').inner_html,
                                                   argument.css('p').inner_html),
                         posted_by: posted_by(argument),
                         like_count: like_count(argument),
                         message_count: message_count(argument) }]
    end
    no_arguments
  end
end
