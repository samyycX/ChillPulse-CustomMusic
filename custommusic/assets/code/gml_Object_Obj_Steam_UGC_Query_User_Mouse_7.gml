var query_handle = steam_ugc_create_query_user(ugc_list_Published, ugc_match_Items, ugc_sortorder_TitleAsc, 1)
query_ID = steam_ugc_send_query(query_handle)
