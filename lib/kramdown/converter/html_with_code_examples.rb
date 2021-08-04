module Kramdown
  module Converter
    class HtmlWithCodeExamples < Html

      # TODO: Idea - Override `format_as_block_html` and `format_as_span_html`
      # to allow rendering specific tags as ViewComponents in the format
      # See also `format_as_indented_block_html`
      # `<%= render COMPONENT_NAME.new(**attr) {body} %>`

      def convert_codeblock(el, _indent)
        example = el.attr.fetch("example", false) == "true";
        el.attr.except! "example"
        
        converted = super
        return converted unless example;

        "
        <%= render Docs::ExampleComponent.new do |example| %>
          <% example.output do %>
            #{el.value}
          <% end %>
          <% example.code do %>
            #{converted}
          <% end %>
        <% end %>
        "
      end
    end
  end
end