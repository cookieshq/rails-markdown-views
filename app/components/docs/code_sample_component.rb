class Docs::CodeSampleComponent < ViewComponent::Base

  attr_accessor :language

  def initialize(language: nil)
    @language = language
  end
end
