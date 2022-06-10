view: sql_runner_query_3 {
  derived_table: {
    sql: SELECT
          sample.Customer_Name  AS customer_name,
          sample.Postal_Code  AS Old_postal_code,
          NULL AS New_postal_code
      FROM `mlconsole-poc.looker_db.sample`
           AS sample
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: old_postal_code {
    type: number
    value_format: "0"
    sql: ${TABLE}.Old_postal_code ;;
    action: {

      label: "Wrong postcode?"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/function-2"

      param: {

        name: "CustomerName"

        value: "{{ customer_name._value }}"

      }
      param: {

        name: "OldPostCode"

        value: "{{ value }}"

      }
      form_param: {
        name: "NewPostCode"

        type: string

        label: "Wrong post code?"

       # default: "{{ value }}"

        description: "Enter the correct postcode"
      }
    }
    action: {

      label: "Want to delete?"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/Deletion"

      param: {

        name: "OldPost"

        value: "{{ value }}"

      }
      form_param: {
        name: "NewPostCode"

        type: string

        label: "Wrong post code?"

        # default: "{{ value }}"

        description: "Enter the correct postcode"
      }
    }
  }

  dimension: new_postal_code {
    type: number
    sql: ${TABLE}.New_postal_code ;;
  }

  set: detail {
    fields: [customer_name, old_postal_code, new_postal_code]
  }
}
