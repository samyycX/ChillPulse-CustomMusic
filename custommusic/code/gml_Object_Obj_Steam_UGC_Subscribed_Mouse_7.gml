var list = ds_list_create()
steam_ugc_get_subscribed_items(list)
instance_destroy(Obj_Steam_UGC_Item)
var a = 0
while (a < ds_list_size(list) && a < 4)
{
    with (instance_create_depth(500, (350 + a * 100), depth, Obj_Steam_UGC_Item))
    {
        text = "Item " + string(a)
        item = ds_list_find_value(list, a)
        fromSubs = true
    }
    a++
}
ds_list_destroy(list)
