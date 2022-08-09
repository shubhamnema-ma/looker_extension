# The name of this view in Looker is "Mobile Tablet"
view: mobile_tablet {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.mobile_tablet`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Campaign" in Explore.

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
 dimension: Detail {
   type: string
   sql:  ;;
 }
  dimension: Country_Wise_Details {
    type: string
    sql: CONCAT(${country},'  ','Detail') ;;
    html:<p style="color: blue; font-size: 100%"><u>{{ value }}</u></p>;;
  }

  measure: country_details {
    type: string
    sql: ${Country_Wise_Details} ;;
    required_fields: [Country_Wise_Details]
    html:
    {% if country._value == 'UK' %}
        <a style="font-weight: bold;color: blue" href = "https://mediaagility.looker.com/dashboards/392"><u>UK Details<u/></a>

    {% elsif country._value == 'USA' %}
           <a style="font-weight: bold;color: blue" href = "https://mediaagility.looker.com/dashboards/390"><u>USA Details<u/></a>
    {% else %}
          <a style="font-weight: bold;color: blue"><u>Canada Details<u/></a>
    {% endif %};;
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: average_impressions {
    type: average
    sql: ${impressions} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: insert_ts {
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
    sql: ${TABLE}.insert_ts ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: pages {
    type: number
    sql: ${TABLE}.pages ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}.persona ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: social_platform {
    type: string
    sql: ${TABLE}.social_platform ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

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

  dimension: total_eligible_impressions {
    type: number
    sql: ${TABLE}.total_eligible_impressions ;;
  }

  dimension: total_entrancevisits {
    type: number
    sql: ${TABLE}.total_entrancevisits ;;
  }

  dimension: total_onepage_visits {
    type: number
    sql: ${TABLE}.total_onepage_visits ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
