require "nokogiri"

module Isis
  module Plugin
    class DefProgramming < Isis::Plugin::Base
      TRIGGERS = %w(!programmingquote !defp !defprogramming)

      def respond_to_msg?(msg, speaker)
        TRIGGERS.include? msg.downcase
      end

      private

      def response_text
        page = Nokogiri.HTML(open('http://defprogramming.com/random'))
        quote = page.css('.jumbotron p').text
        author = page.css('.quote-highlight-author a span').text
        %Q("#{quote}" -- #{author})
      end
    end
  end
end
