view: visits {
  sql_table_name: family_clinic.visits ;;

  dimension: diagnosis_code {
    type: number
    sql: ${TABLE}.diagnosis_code ;;
  }

  dimension: patient_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.patient_id ;;
  }

  dimension_group: service {
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
    sql: ${TABLE}.service_at ;;
  }

  dimension: service_charge {
    type: number
    sql: ${TABLE}.service_charge ;;
  }

  measure: total_service_charge {
    type: sum
    sql: ${service_charge} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [details*]
  }

  set: details {
    fields: [patients.last_name, patients.first_name, patients.id]
  }
}
