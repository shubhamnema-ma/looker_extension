view: vw_fruit_details {
  sql_table_name: `austin_bikeshare.vw_fruit_details`;;


  dimension: fruit {
    type: string
    sql: ${TABLE}.fruit ;;
  }

  dimension_group: purchase {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.purchase_date ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
