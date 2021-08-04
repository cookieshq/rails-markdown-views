# Based on https://www.lugolabs.com/articles/render-markdown-views-with-redcarpet-and-pygment-in-rails
require 'kramdown'
require 'kramdown-parser-gfm'
require 'rouge'

class MarkdownHandler
  class << self
    def call(template, source)
      html = render(source)
      result = erb.call(template, html)
    end

    def render(text)
      Kramdown::Document.new(text, input: 'GfmWithErb', hard_wrap: false).to_html_with_code_examples
    end

    private

      def erb
        @erb ||= ActionView::Template.registered_template_handler(:erb)
      end
  end
end
