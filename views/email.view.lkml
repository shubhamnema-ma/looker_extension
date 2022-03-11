# The name of this view in Looker is "Email"
view: email {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.looker_db.email`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bucket {
    case: {
      when: {
        sql: ${id} like '%shubham%';;
        label: "shubham"
      }

      else:"Other"
    }
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
