# The name of this view in Looker is "Sales Report"
view: sales_report {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.looker_db.sales_report`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name_1 {
    type: string
    sql: concat("Name:",${TABLE}.name) ;;
   # html: <font size="10">{{ value }}</font>
    html: <font size = "3"> {{value}} </font> ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.productSKU ;;
    action: {
      label: "Approve"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/l-action-2"
      param: {
        name: "product_sku"
        value: "{{value}}"
      }
      form_param: {
        name: "approved"
        type: select
        label: "Approve/Reject:"
        default: "true"
        description: "Please select Approve or Reject"
        option: {
          name: "true"
          label: "Approve"
        }
        option: {
          name: "false"
          label: "Reject"
        }
      }
    }
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ratio {
    type: sum
    sql: ${ratio} ;;
  }

  measure: average_ratio {
    type: average
    sql: ${ratio} ;;
  }

  dimension: restocking_lead_time {
    type: number
    sql: ${TABLE}.restockingLeadTime ;;
  }

  dimension: sentiment_magnitude {
    type: number
    sql: ${TABLE}.sentimentMagnitude ;;
  }

  dimension: sentiment_score {
    type: number
    sql: ${TABLE}.sentimentScore ;;
  }

  dimension: stock_level {
    type: number
    sql: ${TABLE}.stockLevel ;;
  }

  dimension: total_ordered {
    type: number
    sql: ${TABLE}.total_ordered ;;
    action: {
      label: "Approve"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/l-action-1"
      param: {
        name: "order_id"
        value: "{{value}}"
      }
      form_param: {
        name: "approved"
        type: select
        label: "Approve/Reject:"
        default: "true"
        description: "Please select Approve or Reject"
        option: {
          name: "true"
          label: "Approve"
        }
        option: {
          name: "false"
          label: "Reject"
        }
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
