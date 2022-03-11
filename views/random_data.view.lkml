# The name of this view in Looker is "Random Data"
view: random_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.random_data`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

filter: test {
  type: date
}


  dimension_group: dt {
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
    sql: ${TABLE}.dt ;;
  }

  dimension_group: dt_convert_tz {
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
    sql: ${TABLE}.dt ;;
    #sql: TIMESTAMP(DATETIME(${TABLE}.dt,"America/New_York")) ;;
    convert_tz: no
  }
  dimension_group: dt_est {
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
    #sql: ${TABLE}.dt ;;
    sql: TIMESTAMP(DATETIME(${TABLE}.dt,"America/New_York")) ;;
    convert_tz: no
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Random Number" in Explore.

  dimension: random_number {
    type: number
    sql: ${TABLE}.random_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_random_number {
    type: sum
    sql: ${random_number} ;;
  }

  measure: average_random_number {
    type: average
    sql: ${random_number} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
