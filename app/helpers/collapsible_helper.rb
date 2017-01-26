# frozen_string_literal: true
module CollapsibleHelper
  def class_def(is_popout)
    if is_popout
      "collapsible popout"
    else
      "collapsible"
    end
  end
end
