# frozen_string_literal: true

class Docs::ExampleFromPartialComponent < ViewComponent::Base

  attr_accessor :partial

  def initialize(partial)
    @partial = partial
  end

  def language
    'erb'
  end

  def output
    render partial
  end

  def partial_full_path
    # Based on: https://github.com/rails/rails/blob/83217025a171593547d1268651b446d3533e2019/actionview/lib/action_view/renderer/partial_renderer.rb#L295
    # Why there's a convention to strip prefixes if there's a `/` instead
    # of using a marker to denote "from app/views" is very curious
    prefixes = partial.include?(?/) ? [] : @lookup_context.prefixes
    template = @lookup_context.find(partial, prefixes, true)
    "#{Rails.root}/#{template.short_identifier}"
  end

  def code_sample
    tag.pre{render file: partial_full_path}
  end

  def code_sample_options
    {language: language}
  end

  def call
    render Docs::ExampleComponent.new do |example|
      example.output{output}
      example.code_sample(code_sample_options){code_sample}
    end
  end
end
