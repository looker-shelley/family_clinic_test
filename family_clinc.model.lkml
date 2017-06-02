connection: "family_clinic"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: visits  {
  hidden: yes
  join: diagnosis_acute {
    from: diagnosis
    relationship: many_to_one
    sql_on: ${visits.diagnosis_code} = ${diagnosis_acute.diagcode}
            And ${diagnosis_acute.diagtype} = 'acute' ;;
  }
  join: diagnosis_chronic {
    from: diagnosis
    relationship: many_to_one
    sql_on: ${visits.diagnosis_code} = ${diagnosis_chronic.diagcode}
            And ${diagnosis_chronic.diagtype} = 'chronic' ;;
  }
}

explore: claims {
  hidden: yes
  join: insurer {
    relationship: many_to_one
    sql_on: ${claims.insurerid} = ${insurer.id} ;;
  }
}

explore: insurer {
  hidden: yes
}
