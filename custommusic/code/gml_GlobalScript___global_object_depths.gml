function __global_object_depths() //gml_Script___global_object_depths
{
    @@Global@@().__objectDepths[0] = 10
    @@Global@@().__objectDepths[1] = 0
    @@Global@@().__objectNames[0] = "obj_example"
    @@Global@@().__objectNames[1] = "obj_input_text"
    var len = array_length_1d(global.__objectDepths)
    global.__objectID2Depth = []
    for (var i = 0; i < len; i++)
    {
        var objID = asset_get_index(@@Global@@().__objectNames[i])
        if (objID >= 0)
            @@Global@@().__objectID2Depth[objID] = @@Global@@().__objectDepths[i]
    }
}

