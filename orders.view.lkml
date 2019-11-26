view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
<<<<<<< HEAD
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.id, users.last_name, order_items.count]
  }
=======
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_order_paid {
    type: yesno
    sql: ${status} = "complete" ;;
  }


  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
  }

  measure: this_month_incomplete_count {
    label: "Customers who haven't paid"
    description: "Customers who haven't paid for their order within the past year"
    type: count_distinct
    sql: ${TABLE}.id ;;
    filters: {
      field: created_year
      value: "1 year"
    }
    filters: {
      field: status
      value: "-complete"
    }
  }

  measure: count_complete {
    type: count_distinct
    sql:  ${user_id} ;;
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
    filters: {
      field: is_order_paid
      value: "yes"
    }
  }

  measure: percent_completed_users {
    type: number
    sql: ${count_complete}/${count} * 1.0 ;;
  }


>>>>>>> branch 'dev-mandy-chan-bjs7' of https://github.com/mandy-chan/Mandys-Looker.git
}
