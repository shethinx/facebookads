view: campaign_utm {
  derived_table: {
    sql:
      SELECT
        id,
        split_part((regexp_substr(object_story_spec__link_data__link,'campaign=([^&]*)[^&]')),'=',2) as utm_campaign
      FROM facebook_ads_thinx_via_stitch.adcreative
      ;;
  }
  # later, dimension declarations reference the derived column(s)

  dimension: creative_id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }
}
