# frozen_string_literal: true

class Scrapper::ScrapeBase
  def self.concat_strings(bold_text, paragraph_text)
    remove_html_tags(bold_text) + ' ' + paragraph_text
  end

  def self.remove_html_tags(bold_text)
    bold_text.gsub(/<("[^"]*"|'[^']*'|[^'">])*>/, '').strip
  end

  def self.like_count(argument)
    argument.css('.like-contain').css('.l-cnt').inner_html
  end

  def self.message_count(argument)
    argument.css('.msg-contain').css('.m-cnt').inner_html
  end

  def self.posted_by(argument)
    posted_by = argument.css('.qt').css('cite').inner_html
    remove_html_tags(posted_by)
  end
end
