view: claims {
  sql_table_name: family_clinic.claims ;;

  dimension_group: claimdate {
    type: time
    sql: ${TABLE}.claimdate ;;
    timeframes: [raw,
      time,
      date,
      week,
      month,
      quarter,
      year]
  }

  dimension: diagnosiscode {
    type: number
    sql: ${TABLE}.diagnosiscode ;;
  }

  dimension: insurerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.insurerid ;;
  }

  dimension: insurerorder {
    type: string
    sql: ${TABLE}.insurerorder ;;
  }

  dimension: patientid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.patientid ;;
  }

  measure: count {
    type: count
    drill_fields: [patients.last_name, patients.first_name, patients.id]
  }
}
