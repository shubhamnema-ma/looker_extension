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
    sql: ${TABLE}.Row_ID ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
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

  measure: count {
    type: count
    label: "Count of Orders"
    drill_fields: [customer_name, product_name]
    value_format:"[>=1000]0,\"K\";0"
  }

  measure: sales_sum {
    type: sum
    value_format:"[>=1000]0,\"K\";0"
    sql: ${sales};;
  }

  dimension: dummy {
    type: string
    sql: 1 ;;
    html: <div>
        <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="color: #ffffff; padding: 5px 15px; border-top: solid 1px #27a9e1 border-left: solid 1px #27a9e1; border-right: solid 1px #27a9e1; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #27a9e1;" href="#home">Summarised</a>
        <a style="color: #27a9e1; padding: 5px 15px; border-bottom: solid 1px #27a9e1; float: left; line-height: 40px;" href="/dashboards/299?State={{ _filters['sample.state'] | url_encode }}">Detailed</a>
            </nav>
                </div> ;;
  }


  dimension: dummy1 {
    type: string
    sql: 1 ;;
    html: <div>
        <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
    <a style="color: #27a9e1; padding: 5px 15px; border-bottom: solid 1px #27a9e1; float: left; line-height: 40px;" href="/dashboards/298?State={{ _filters['sample.state'] | url_encode }}">Summarised</a>
    <a style="color: #ffffff; padding: 5px 15px; border-top: solid 1px #27a9e1 border-left: solid 1px #27a9e1; border-right: solid 1px #27a9e1; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #27a9e1;" href="#home">Detailed</a>
        </nav>
        </div> ;;
  }

}
