<<<<<<< HEAD
view: zozo_table_20190508 {
  sql_table_name: demo_db.zozo_table_20190508 ;;

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  dimension_group: users_created {
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
    sql: ${TABLE}.`users.created_date` ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}.`users.first_name` ;;
  }

  dimension: users_last_name {
    type: string
    sql: ${TABLE}.`users.last_name` ;;
  }

  measure: count {
    type: count
    drill_fields: [users_first_name, users_last_name]
=======
view: renaming_view_20190508 {
  sql_table_name: demo_db.zozo_table_20190508 ;;

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  dimension_group: users_created {
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
    sql: ${TABLE}.`users.created_date` ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}.`users.first_name` ;;
  }

  dimension: users_last_name {
    type: string
    sql: ${TABLE}.`users.last_name` ;;
  }

  measure: count {
    type: count
    drill_fields: [users_last_name, users_first_name]
>>>>>>> branch 'dev-mandy-chan-bjs7' of https://github.com/mandy-chan/Mandys-Looker.git
  }
}
