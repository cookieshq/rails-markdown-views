# frozen_string_literal: true

class Docs::OptionsComponent < ViewComponent::Base

  renders_many :items, Docs::OptionsComponent

  def content?
    content.present?
  end

  def initialize(type: nil, name: nil, description: nil, **attributes)
    @type = type
    @name = name
    @description = description
    @attributes = attributes
  end

  def slot(name , description = nil, **options, &block)
    item(type: :slot,name: name, description: description, **options, &block)
  end

  def slots(name, description = nil, **options, &block)
    item(type: :slots,name: name, description: description, **options)
  end

  def attribute(name, description = nil, **options, &block)
    item(type: :attribute,name: name, description: description, **options)
  end

  def attributes(name, description = nil,  **options, &block)
    item(type: :attributes, name: name, description: description, **options)
  end
end
