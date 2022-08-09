# The name of this view in Looker is "Test1"
view: test1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.durga_bigquery.Test1`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual Price" in Explore.

  dimension: actual_price {
    type: number
    sql: ${TABLE}.actual_price ;;
  }

  dimension: SalesChannel {
    type: string
    sql: ${TABLE}.SalesChannel;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: ML_price_min {
    type: min
    sql: ${TABLE}.ML_price;;
  }
  measure: ML_price_25_percentile {
    type: percentile
    percentile: 25
    sql: ${TABLE}.ML_price;;
  }
  measure: ML_price_75_percentile {
    type: percentile
    percentile: 75
    sql: ${TABLE}.ML_price;;
  }
  measure: ML_price_max {
    type: max
    sql: ${TABLE}.ML_price;;
  }
  measure: ML_price_median {
    type: median
    sql: ${TABLE}.ML_price;;
  }
  measure: average_actual_price {
    type: average
    sql: ${actual_price} ;;
  }

  dimension: competitor_price {
    type: number
    sql: ${TABLE}.competitor_price ;;
  }

  dimension: ml_price {
    type: number
    sql: ${TABLE}.ML_price ;;
  }

  measure: ml_price_test {
    sql: max(${TABLE}.ML_price) ;;
  }
  dimension: size_code {
    type: string
    sql: ${TABLE}.SizeCode ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  measure: count {
    type: count
    drill_fields: []
  }
}
