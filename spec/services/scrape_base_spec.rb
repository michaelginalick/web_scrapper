# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::ScrapeBase, type: :service do
  describe '.concat_strings' do
    it 'will recieve two strings and return one string' do
      expected_string = 'this should be the result'
      expect(Scrapper::ScrapeBase.concat_strings('this should be', 'the result')).to eq(expected_string)
    end

    it 'will return a concated string with the html tags removed from the first argument' do
      expected_string = 'this should be the result'
      expect(Scrapper::ScrapeBase.concat_strings('<s>this should be</s>', 'the result')).to eq(expected_string)
    end
  end

  describe '.remove_html_tags' do
    let(:html_snippet) { "<html><body><class='q-title'><s><b>Text goes here</b></s></class></body></html>" }

    it 'will remove html tags from a string' do
      expect(Scrapper::ScrapeBase.remove_html_tags(html_snippet)).to eq('Text goes here')
    end

    it 'will return the string if it does not contain any html tags' do
      expect(Scrapper::ScrapeBase.remove_html_tags('Text goes here')).to eq('Text goes here')
    end
  end

  describe '.like_count' do
    let(:like_html_snippet) { "<html><body><div><div class='like-contain'><div class='l-cnt'>123</class></class></div></body></html>" }
    let(:no_like_html_snippet) { "<html><body><div><div class='like-contain'><div class='l-cnt'></class></class></div></body></html>" }

    it 'will return the total number of likes from an opinion' do
      expect(Scrapper::ScrapeBase.like_count(Nokogiri::HTML(like_html_snippet))).to eq('123')
    end

    it 'will return an empty string if there are no likes' do
      expect(Scrapper::ScrapeBase.like_count(Nokogiri::HTML(no_like_html_snippet))).to eq('')
    end
  end

  describe '.message_count' do
    let(:message_html_snippet) { "<html><body><div><div class='msg-contain'><div class='m-cnt'>123</class></class></div></body></html>" }
    let(:no_message_html_snippet) { "<html><body><div><div class='msg-contain'><div class='m-cnt'></class></class></div></body></html>" }

    it 'will return the total number of replies from an opinion' do
      expect(Scrapper::ScrapeBase.message_count(Nokogiri::HTML(message_html_snippet))).to eq('123')
    end

    it 'will return an empty string if there are no replies' do
      expect(Scrapper::ScrapeBase.message_count(Nokogiri::HTML(no_message_html_snippet))).to eq('')
    end
  end

  describe '.posted_by' do
    let(:user_posted_html_snippet) { "<html><body> <div class='qt'><cite>Posted by: <a href='/Panlie-Invent/'>Panlie-Invent</a> </cite></class></body></html>" }
    let(:anon_posted_html_snippet) { "<html><body> <div class='qt'><cite></cite></class></body></html>" }

    it 'will return the username of the user who posted the argument' do
      expect(Scrapper::ScrapeBase.posted_by(Nokogiri::HTML(user_posted_html_snippet))).to eq('Posted by: Panlie-Invent')
    end

    it 'will return an empty string if the comment was posted anonymously' do
      expect(Scrapper::ScrapeBase.posted_by(Nokogiri::HTML(anon_posted_html_snippet))).to eq('')
    end
  end
end
