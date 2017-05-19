# frozen_string_literal: true

module CardsHelper
  def sticky_actions(value)
    value ? " sticky-action" : ""
  end

  def activator(value)
    "activator" unless value
  end

  def card_class(sticky, size)
    sticky_actions(sticky) + " " + card_size(size)
  end

  def card_size(size)
    size.blank? ? "" : size
  end
end
