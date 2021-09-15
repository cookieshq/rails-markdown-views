class Docs::CodeSampleComponent < ViewComponent::Base
  def initialize(language: nil)
    @language = language
  end
end
