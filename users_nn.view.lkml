view: users_nn {
  sql_table_name: demo_db.usersNN ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  measure: count {
    type: count
<<<<<<< HEAD
    drill_fields: [id, first_name, last_name]
=======
    drill_fields: [id, last_name, first_name]
>>>>>>> branch 'dev-mandy-chan-bjs7' of https://github.com/mandy-chan/Mandys-Looker.git
  }
}
