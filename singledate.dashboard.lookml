- dashboard: lookerapi
  title: lookerapi
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  query_timezone: user_timezone
  elements:
  - title: Name Details
    name: Name Details
    model: looker_db
    explore: sales_report
    type: looker_grid
    fields: [sales_report.name, sales_report.count]
    sorts: [sales_report.name]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 12
    height: 7
  - title: Total Count
    name: Total Count
    model: looker_db
    explore: sales_report
    type: single_value
    fields: [sales_report.count]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 5
    col: 12
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: looker_db
    explore: random_data
    type: looker_grid
    fields: [random_data.dt_time]
    filters:
      random_data.test: 2021/08/02
    sorts: [random_data.dt_time desc]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Dt Date: random_data.dt_date
    row: 0
    col: 1
    width: 22
    height: 5
  filters:
  - name: Dt Date
    title: Dt Date
    type: field_filter
    default_value:
    allow_multiple_values: false
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: looker_db
    explore: random_data
    listens_to_filters: []
    field: random_data.dt_date
