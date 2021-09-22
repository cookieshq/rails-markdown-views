# Markdown ERB example

A paragraph over a couple of lines
I'm not sure why a `<br>` gets there though

Another paragraph

<%= tag.div do %>
  <%= tag.p do %>
    <%= "Hello from ERB" %>
  <% end %>
<% end %>

## API <%= "with inline ERB" %>

<%= render Docs::OptionsComponent.new do |options| %>
  <% options.slot(:code, "Description") %>
  <% options.slot(:output) do %>

A longer description. **Markdown even gets inline interpolation.**

```
Block level markdown needs to be starting within 0-3 space of the start of the line, otherwise it won't get recognised
```

  <% end %>
<% end %>

## Examples

```erb
<%= render Docs::ExampleComponent.new do |example| %>
  <% example.output do %>
    This'll show the result of the evaluated code
  <% end %>
  <% example.code_sample do %>
    <pre class="highlight">Place the code that generates the content here</pre>
  <% end %>
<% end %>
```
{:example="true"}

<%= render Docs::ExampleComponent.new do |example| %>
  <% example.output do %>
    <%= render example_partial %>
  <% end %>
  <% example.code_sample(language: 'erb'){sample} %>
<% end %>

<%= render Docs::ExampleFromPartialComponent.new('home/examples/example1') %>
