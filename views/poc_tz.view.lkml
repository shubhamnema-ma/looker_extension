# The name of this view in Looker is "Poc Tz"
view: poc_tz {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.durga_bigquery.poc_tz`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Call Type" in Explore.

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: conversation_end {
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
    sql: ${TABLE}.conversation_end ;;
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}.conversation_id ;;
  }

  dimension_group: conversation_start {
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
    sql: ${TABLE}.conversation_start ;;
  }

  dimension_group: conversation_start_test {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      time
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.conversation_start_date ;;
  }

  dimension: conversation_success {
    type: string
    sql: ${TABLE}.conversation_success ;;
  }

  dimension: end_user_phone_number {
    type: string
    sql: ${TABLE}.end_user_phone_number ;;
  }

  dimension: exit {
    type: string
    sql: ${TABLE}.exit ;;
  }

  dimension: exit_type {
    type: string
    sql: ${TABLE}.exit_type ;;
  }

  dimension: holly_call_id {
    type: string
    sql: ${TABLE}.holly_call_id ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension_group: load_timestamp {
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
    sql: ${TABLE}.load_timestamp ;;
  }

  dimension_group: nerve_log_timestamp {
    label: "Original Timezone"
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
    sql: ${TABLE}.nerve_log_timestamp ;;
  }

  parameter: Timezone {
    type: string
    allowed_value: {

      value: "Local"

    }

    allowed_value: {

      value: "Australia/Sydney"

    }

    allowed_value: {

      value: "Europe/London"

    }

    allowed_value: {

      value: "America/New_York"

    }

    allowed_value: {

      value: "UTC"

    }
  }
  dimension: nerve {
    label: "Converted Timezone"
    type: date_time
    sql:  DATETIME(((TIMESTAMP(${nerve_log_timestamp_time}))), {{Timezone._parameter_value}}) ;;
  }
  dimension: outreach_id {
    type: string
    sql: ${TABLE}.outreach_id ;;
  }

  dimension: provider_number {
    type: number
    sql: ${TABLE}.provider_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_provider_number {
    type: sum
    sql: ${provider_number} ;;
  }

  measure: average_provider_number {
    type: average
    sql: ${provider_number} ;;
  }

  dimension: published_message_id {
    type: string
    sql: ${TABLE}.published_message_id ;;
  }

  dimension_group: published_timestamp {
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
    sql: ${TABLE}.published_timestamp ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: subscribed_timestamp {
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
    sql: ${TABLE}.subscribed_timestamp ;;
  }

  dimension: turn_id {
    type: string
    sql: ${TABLE}.turn_id ;;
  }

  dimension: test {
    type: string
    sql: DATETIME(((TIMESTAMP(poc_tz.conversation_start_date))), "{{ _user_attributes['timezone'] }}") ;;
  }
  #######Timezone specific data######

  dimension: Date_filter {
    type: string
    sql: CAST(${conversation_start_test_date} AS STRING) ;;
  }

  filter: date_filter {
    type: string
    suggest_explore: poc_tz
    suggest_dimension: Date_filter
  }

  dimension: difference {
    type: number
    sql: TIMESTAMP_DIFF(TIMESTAMP(FORMAT_TIMESTAMP('%F %T', poc_tz.nerve_log_timestamp )) ,     TIMESTAMP(FORMAT_TIMESTAMP('%F %T', DATETIME(((TIMESTAMP((FORMAT_TIMESTAMP('%F %T', poc_tz.nerve_log_timestamp ))))), {{Timezone._parameter_value}}) )),HOUR) ;;
  }

  dimension: start_filter {

    sql:
    CASE
    WHEN ${difference} < 0
    THEN (FORMAT_TIMESTAMP('%F %T',TIMESTAMP_ADD(TIMESTAMP(CAST(poc_tz.conversation_start_date AS STRING)),INTERVAL (-1 * ${difference}) HOUR)))
     WHEN ${difference} > 0
    THEN (FORMAT_TIMESTAMP('%F %T',TIMESTAMP_ADD(TIMESTAMP(CAST(poc_tz.conversation_start_date AS STRING)),INTERVAL (1 * -${difference}) HOUR)))
    ELSE NULL
    END
    ;;
  }

  dimension: end_filter {
    sql:(FORMAT_TIMESTAMP('%F %T',TIMESTAMP_ADD(TIMESTAMP(${start_filter}),INTERVAL 1 DAY))) ;;
  }
  dimension: check {
    type: yesno
    sql:{%condition date_filter%} ${Date_filter} {% endcondition %}
    AND
    (
    ${nerve} > ${start_filter}
    AND
    ${nerve} < ${end_filter}
    )
    ;;
  }

parameter: Check_test {
  type: string
  allowed_value: {
    value: "year"
    label: "By year"
  }
}

  measure: count {
    type: count
    drill_fields: []
  }
}
