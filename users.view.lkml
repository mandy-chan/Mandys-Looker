view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

<<<<<<< HEAD
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
=======
  dimension: age_tier {
    type: tier
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
    style: integer
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: nownow {
    type: date
    sql: now();;
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
    html:
      {% if rendered_value == users.nownow._rendered_value %}
      <div style=" background-color: #d36b6b">{{ rendered_value }}</div>
      {% else %}
      <div style=" background-color: #dddddd">{{ rendered_value }}</div>
      {% endif %};;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  parameter: email_is_blank {
    type: string
    allowed_value: {
      label: "BLANK"
      value: "BLANK"
    }
    allowed_value: {
      label: "NOT BLANK"
      value: "NOT BLANK"
    }
  }

  dimension: blank {
    label_from_parameter: email_is_blank
    sql:
      CASE
        WHEN {% parameter email_is_blank %} = 'BLANK' THEN ${email} = NULL
           ELSE
              ${email}
           END ;;
  }


  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: max_created_date {
    type: max
    sql: ${created_month} ;;
  }

  measure: count_of_females {
    type: count_distinct
    filters:  {
      field: gender
      value: "f"
    }
    sql: ${gender} ;;
  }

  measure: count_states {
    type: number
    sql: COUNT(${state}) ;;
>>>>>>> branch 'dev-mandy-chan-bjs7' of https://github.com/mandy-chan/Mandys-Looker.git
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
