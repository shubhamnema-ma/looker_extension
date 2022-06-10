connection: "dv-looker-poc"

include: "/views/*.view.lkml"
include: "/singledate.dashboard.lookml"
include: "/views/sql_runner_query.view.lkml"

# include all views in the views/ folder in this project

explore: sales_report {}
explore: sql_runner_query_1 {}
explore: sql_runner_query_3 {}
# Place in `looker_db` model
explore: employee {}
explore: mobile_tablet {}
explore: sales_test {
  from: sales_report
  aggregate_table: rollup__name {
    query: {
      dimensions: [name]
      measures: [count]
      timezone: "America/Los_Angeles"
    }
    materialization: {
      sql_trigger_value: SELECT CURDATE() ;;
    }
   }
}

explore: email {}

explore: random_data {}

explore: sample {
}

explore: sql_runner_query {
  join: sample {
    type: full_outer
    sql_on: ${sample.row_id} = ${sql_runner_query.sample_row_id_1} ;;
  }
}
