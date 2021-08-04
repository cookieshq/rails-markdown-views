# frozen_string_literal: true

class Docs::ExampleComponent < ViewComponent::Base

  class CodeComponent < ViewComponent::Base

    def initialize(language: nil)
      @language = language
    end

    def call
      content
    end
  end

  renders_one :output
  renders_one :code, CodeComponent
end
