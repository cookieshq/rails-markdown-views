# frozen_string_literal: true

class Docs::ExampleFromPublicComponent < ViewComponent::Base

  BASE = 'docs/examples'

  def initialize(file: nil)
    @file = file
  end

  def file_path
    Rails.root + 'public' + BASE + "#{@file}.html"
  end

  def output
    tag.iframe(src: [BASE, "#{@file}.html"].join('/'))
  end

  def code_sample
    tag.pre(IO.binread(file_path).force_encoding('UTF-8'))
  end

  def code_sample_options
    {language: "HTML"}
  end

  def call
    render Docs::ExampleComponent.new do |example|
      example.output{output}
      example.code_sample(code_sample_options){code_sample}
    end
  end
end
