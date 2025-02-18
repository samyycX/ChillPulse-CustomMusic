var query_handle = steam_ugc_create_query_all(ugc_query_RankedByTrend, ugc_match_Items, 1)
query_ID = steam_ugc_send_query(query_handle)
