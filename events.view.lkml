view: events {
  sql_table_name: demo_db.events ;;

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
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
<<<<<<< HEAD
    drill_fields: [id, users.first_name, users.id, users.last_name]
=======
    drill_fields: [id, users.id, users.first_name, users.last_name]
>>>>>>> branch 'dev-mandy-chan-bjs7' of https://github.com/mandy-chan/Mandys-Looker.git
  }
}
