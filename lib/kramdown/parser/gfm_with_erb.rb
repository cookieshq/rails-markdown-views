require 'kramdown-parser-gfm'

# Following the example from Kramdown's Parser documentation
# https://kramdown.gettalong.org/rdoc/Kramdown/Parser/Kramdown.html
class Kramdown::Parser::GfmWithErb < Kramdown::Parser::GFM

  def initialize(source, options)
    super
    # Prevent parsing indented code blocks to avoid silly formatting
    # when nesting paragraphs inside ERB blocks 
    @block_parsers = @block_parsers.without(:codeblock)

    # TODO: Sort parsing when ERB is inside an HTML tag
    # Will likely rely of finding a way to override the HTML_TAG_RE
    # and `handle_html_start_tag` from Kramdown::Parser::Html 
    # which is included in the Kramdown::Parser::Kramdown (and in GFM in turn)
    @block_parsers.unshift(:erb_tags)
    @span_parsers.unshift(:erb_tags)
  end

  # Allow any level of intenting before an ERB block
  ERB_TAGS_START = /^\s*<%.*?%>/

  def parse_erb_tags
    @src.pos += @src.matched_size
    @tree.children << Element.new(:raw, @src.matched)
  end
  
  # Reloading seems to make the parser get re-registered while already defined
  # so putting a little check ahead of the registration
  unless has_parser?(:erb_tags)
    define_parser(:erb_tags, ERB_TAGS_START, '<%')
  end

end
