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
    link:
    {
      label: "name"
    url: "https://mediaagility.looker.com/dashboards/292?Name={{value}}"
    }
  }

  dimension: lookerapi {
    type: string
    sql: 1 ;;
    html: <div style="border-bottom: solid 1px #27a9e1;">
        <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="color: #ffffff; padding: 5px 15px; border-top: solid 1px #27a9e1 border-left: solid 1px #27a9e1; border-right: solid 1px #27a9e1; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #27a9e1;" href="#home">lookerapi</a>
        <a style="color: #27a9e1; padding: 5px 15px; border-bottom: solid 1px #27a9e1; float: left; line-height: 40px;" href="/dashboards/287?Name={{ _filters['sales_report.name'] | url_encode }}">lookerapi</a>
            </nav>
                </div> ;;
    }

  dimension: lookerapi1 {
    type: string
    sql: 1 ;;
    html: <div style="border-bottom: solid 1px #27a9e1;">
        <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
  <a style="color: #ffffff; padding: 5px 15px; border-top: solid 1px #27a9e1 border-left: solid 1px #27a9e1; border-right: solid 1px #27a9e1; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #27a9e1;" href="#home">lookerapi1</a>
  <a style="color: #27a9e1; padding: 5px 15px; border-bottom: solid 1px #27a9e1; float: left; line-height: 40px;" href="/dashboards/293?Name={{ _filters['sales_report.name'] | url_encode }}">lookerapi1</a>
            </nav>
                </div> ;;
    }

  dimension: lkr1 {
    type: string
    sql: 1 ;;
    html: <div style="border-bottom: solid 1px #27a9e1;">
        <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
  <a style="color: #ffffff; padding: 5px 15px; border-top: solid 1px #27a9e1 border-left: solid 1px #27a9e1; border-right: solid 1px #27a9e1; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #27a9e1;"  href="/dashboards/293?Name={{ _filters['sales_report.name'] | url_encode }}">lkr1</a>
  <a style="color: #27a9e1; padding: 5px 15px; border-bottom: solid 1px #27a9e1; float: left; line-height: 40px;" href="/dashboards/295?Name={{ _filters['sales_report.name'] | url_encode }}">lkr2</a>
            </nav>
                </div> ;;
  }

  dimension: lkr2 {
    type: string
    sql: 1 ;;
    html: <div style="border-bottom: solid 1px #27a9e1;">
        <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
  <a style="color: #ffffff; padding: 5px 15px; border-top: solid 1px #27a9e1 border-left: solid 1px #27a9e1; border-right: solid 1px #27a9e1; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #27a9e1;"  href="/dashboards/293?Name={{ _filters['sales_report.name'] | url_encode }}">lkr2</a>
  <a style="color: #27a9e1; padding: 5px 15px; border-bottom: solid 1px #27a9e1; float: left; line-height: 40px;" href="/dashboards/294?Name={{ _filters['sales_report.name'] | url_encode }}">lkr1</a>
            </nav>
                </div> ;;
  }





  dimension: name2 {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.productSKU ;;
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
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
