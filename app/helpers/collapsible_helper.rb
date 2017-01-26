# frozen_string_literal: true
module CollapsibleHelper
  def class_def(is_popout)
    "collapsible" + (is_popout ? " popout" : "")
  end
end
