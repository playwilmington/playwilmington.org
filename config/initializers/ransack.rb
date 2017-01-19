Ransack.configure do |config|

  # Change default search parameter key name.
  # Default key name is :q
  config.search_key = :q

  # Raise errors if a query contains an unknown predicate or attribute.
  # Default is true (do not raise error on unknown conditions).
  config.ignore_unknown_conditions = false

  # Globally display sort links without the order indicator arrow.
  # Default is false (sort order indicators are displayed).
  # This can also be configured individually in each sort link (see the README).
  config.hide_sort_order_indicators = false

  # Globally Set arrows for sort links
  # config.custom_arrows = {
  #   up_arrow: '<i class="material-icons">arrow_drop_up</i>',
  #   down_arrow: '<i class="material-icons">arrow_drop_down</i>'
  # }
end
