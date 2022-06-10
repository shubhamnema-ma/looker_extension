# The name of this view in Looker is "Mobile Tablet"
view: mobile_tablet {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.mobile_tablet`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active Session" in Explore.

  dimension: active_session {
    type: number
    sql: ${TABLE}.active_session ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_session {
    type: sum
    sql: ${active_session} ;;
  }

  measure: average_active_session {
    type: average
    sql: ${active_session} ;;
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
  }

  dimension: avg_time_on_page {
    type: number
    sql: ${TABLE}.avg_time_on_page ;;
  }

  dimension: bounce_rate {
    type: number
    sql: ${TABLE}.bounce_rate ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: download_detail {
    type: string
    sql: ${TABLE}.download_detail ;;
  }

  dimension: engagements {
    type: number
    sql: ${TABLE}.engagements ;;
  }

  dimension: form_completion {
    type: number
    sql: ${TABLE}.form_completion ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: goal_1_initiate_rx_define {
    type: number
    sql: ${TABLE}.goal_1_initiate_rx_define ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: insert_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.insert_ts ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}.landing_page ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: page_scroll_by {
    type: string
    sql: ${TABLE}.page_scroll_by ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: sessions_per_visitors {
    type: number
    sql: ${TABLE}.sessions_per_visitors ;;
  }

  dimension: site_interaction_by {
    type: string
    sql: ${TABLE}.site_interaction_by ;;
  }

  dimension: social_network {
    type: string
    sql: ${TABLE}.social_network ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ts ;;
  }

  dimension: unique_users {
    type: number
    sql: ${TABLE}.unique_users ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }
  dimension: detail {
    type: string
    sql: CONCAT(${country},":",${download_detail},":",${engagements},":",${os}) ;;
  }
  measure: drill {
    type: string
    sql: "Drill" ;;
    drill_fields: [session_id,timestamp_date,device,detail]
    link: {
      label: "Show as Detailed result" #or your label of choice
      url: "
      {% assign vis_config = '{
      \"show_view_names\":false,\"show_row_numbers\":true,\"transpose\":false,\"truncate_text\":true,\"hide_totals\":false,\"hide_row_totals\":false,\"size_to_fit\":true,\"table_theme\":\"white\",\"limit_displayed_rows\":false,\"enable_conditional_formatting\":false,\"header_text_alignment\":\"left\",\"header_font_size\":12,\"rows_font_size\":12,\"conditional_formatting_include_totals\":false,\"conditional_formatting_include_nulls\":false,\"type\":\"looker_grid\",\"defaults_version\":1,\"series_types\":{},\"hidden_fields\":[\"mobile_tablet.drill\"]
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
