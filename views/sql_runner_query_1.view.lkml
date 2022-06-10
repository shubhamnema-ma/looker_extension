view: sql_runner_query_1 {
  derived_table: {
    sql: SELECT a.sample_customer_id
      FROM
      (SELECT
          sample.Customer_ID  AS sample_customer_id ,
          sample.City  AS sample_city
      FROM `mlconsole-poc.looker_db.sample`
           AS sample
      GROUP BY
          1,
          2
      ORDER BY
          1)a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sample_customer_id {
    type: string
    sql: ${TABLE}.sample_customer_id ;;
  }

  set: detail {
    fields: [sample_customer_id]
  }
}
