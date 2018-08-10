view: insurer {
  sql_table_name: family_clinic.insurer ;;

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
    hidden: yes
  }

  dimension: id {
    type: number
    sql: (${details}:: json ->> 'id') :: integer ;;
  }

  dimension: payout_rate {
    type: number
    sql: (${details}:: json ->> 'payout_rate') :: float ;;
  }

  dimension: state {
    type: string
    sql: (${details}:: json ->> 'state');;
  }

  dimension: active {
    type: string
    sql: (${details}:: json ->> 'active') ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
