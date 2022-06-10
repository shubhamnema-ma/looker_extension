# The name of this view in Looker is "Sample"
view: sample {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.looker_db.sample`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
    action: {

      label: "Want to delete the Row ID?"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/update"

      form_param: {
        name: "City"

        type: string

        label: "Deleting the Row ID"

        default: "{{ value }}"

        description: "Enter the correct postcode"
      }
    }
  }

  dimension: country_region {
    type: string
    sql: ${TABLE}.Country_Region ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.Customer_ID ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: order {
    type: time
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Order_Date ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.Order_ID ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.Postal_Code ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.Profit ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_profit {
    type: sum
    sql: ${profit} ;;
    value_format:"[>=1000]0,\"K\";[<=1000]0,\"K\";0.00"
  }

  measure: average_profit {
    type: average
    sql: ${profit} ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: row_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.Row_ID;;
    action: {

      label: "Want to delete the Row ID?"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/delete"

      form_param: {
        name: "CodeDelete"

        type: string

        label: "Deleting the Row ID"

        default: "{{ value }}"

        description: "Enter the correct postcode"
      }
    }
  }

  dimension: concat_row_id {
    type: string
    sql: CONCAT(${row_id},",") ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: Quarter  {
    type: string
    sql: CONCAT("Q",EXTRACT(QUARTER FROM CURRENT_DATE()));;
  }
  dimension: test {
    type: yesno
    sql: (${Quarter} = ${order_quarter_of_year}
         OR CAST(${test_current_date} AS STRING) = 'Yes') AND ${order_year} = 2019 ;;
  }
  parameter: QTD {
    type: unquoted
    allowed_value: {
      label: "QTD Testing"
      value : "QTD"
    }
  }
  dimension: check {
    sql: {% if QTD._parameter_value == 'QTD' %}
          ${order_date}
          {% else %}
          ${order_date}
           {% endif %};;
  }
  dimension: test_current_date {
    type: yesno
    sql: ${order_date} < (SELECT CURRENT_DATE()) ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }

  dimension_group: ship {
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
    sql: ${TABLE}.Ship_Date ;;
  }

  dimension: ship_mode {
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }
   dimension_group: record_created_at {
     type: time
     sql: CURRENT_TIMESTAMP() ;;
   }
  measure: count {
    type: count
    label: "Count of Orders"
    drill_fields: [customer_name, product_name]
    value_format:"[>=1000]0,\"K\";0"
  }

  measure: sales_sum {
    type: sum
    value_format: "0"
    sql: ${sales};;
  }
}
