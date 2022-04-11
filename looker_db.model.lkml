connection: "dv-looker-poc"

include: "/views/*.view.lkml"
include: "/singledate.dashboard.lookml"

# include all views in the views/ folder in this project

explore: sales_report {}

# Place in `looker_db` model

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

explore: sample {}
