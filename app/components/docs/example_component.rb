# frozen_string_literal: true

class Docs::ExampleComponent < ViewComponent::Base
  renders_one :output
  renders_one :code, Docs::CodeSampleComponent
end
