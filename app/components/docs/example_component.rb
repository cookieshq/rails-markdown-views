# frozen_string_literal: true

class Docs::ExampleComponent < ViewComponent::Base
  renders_one :output
  # TODO: Make it a renders_many so we can document multiple samples
  # for example: HTML/CSS/JS or Controller/View/Helpers
  renders_many :code_samples, Docs::CodeSampleComponent
end
