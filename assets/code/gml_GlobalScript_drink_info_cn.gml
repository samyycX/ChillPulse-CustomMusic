function drink_info_cn() //gml_Script_drink_info_cn
{
    if (current_scene == 0)
    {
        list_drink_material = ["牛奶", "咖啡", "糖浆"]
        drink_menu = ["和谐之杯", "浓郁意式咖啡", "牛奶", "天鹅绒意式咖啡", "甜醇咖啡", "蜜糖轻风", "云朵舒适", "糖浆丝滑", "奶油瀑布", "甜美精华"]
        drink_descrip = ["咖啡、牛奶与甜味的完美平衡混合，\n调和所有风味。", "纯净、浓郁的意式咖啡射击，为喜欢\n咖啡原味的人准备。", "只是热牛奶", "顺滑绵密，这款饮品结合了咖啡的浓\n郁深度与牛奶的天鹅绒般的质地。", "带有一丝甜味的浓郁咖啡，适合\n温和提神的体验。", "轻微含咖啡因且味道甜美，适合\n喜欢柔和咖啡触感的人。", "舒适的奶油味热饮，带有甜美的\n收尾，适合放松时刻。", "加倍糖浆的丝滑牛奶，提供奢华的甜味。", "奶油的丰富牛奶在浓郁的咖啡基底上\n流淌，创造出丰富、顺滑的质感。", "强烈的仅糖浆混合物，为喜欢纯甜味\n的人准备。"]
    }
    else if (current_scene == 1)
    {
        list_drink_material = ["烈酒", "果汁", "利口酒"]
        drink_menu = ["断路器", "Bad Touch", "赛博迷雾", "光子爆破", "Piano Man", "Moonblast", "铬夜", "电子嗡嗡", "数据流", "神经同步"]
        drink_descrip = ["一种打破感官的饮品，提供对抗\n数字霸主的味道。", "Alma 想要一个……呃……\n一个 Bad Touch。", "神秘且难以捉摸的鸡尾酒，其银色\n本质唤起未来的雾茫茫。", "一款尖锐且清新的鸡尾酒，带有似乎\n带电的发光质量。", "一个奇怪的饮料。嗯……促销饮料\n轻松符合这个要求。", "来点小的、甜的、冰凉的东西。", "为城市夜行者设计的凉爽且光滑的饮\n品，反射月光下城市的金属光泽。", "一种强效的刺激饮品，为夜间的黑客\n活动和探险提供能量。", "象征网络领域信息无休止流动的顺滑\n且流畅的鸡尾酒。", "一种纯净未稀释的霓虹酒精，为希望\n直接连接到霓虹网格的人准备。"]
    }
    else if (current_scene == 2)
    {
        list_drink_material = ["绿茶", "茉莉", "枸杞"]
        drink_menu = ["翠玉清风", "茉莉初露", "仙露琼浆", "三花聚顶", "龙眼佳人", "琼浆玉露", "红颜旧", "宫廷秘饮", "花好月圆", "君子兰"]
        drink_descrip = ["纯粹的绿茶享受，清新且使人焕发青春，\n古代学者和诗人的最爱。", "以绿茶为基底，微妙的茉莉芬芳，清新\n优雅，带有温柔的花香。", "结合枸杞和绿茶新鲜香气的滋养混合物，\n提供健康与活力。", "三种成分的完美和谐，象征风味的\n平衡与统一。", "以浓郁的茉莉香气为主，绿茶为基础，\n恍如古代美女弹奏古琴的触感。", "芳香的茉莉与甜美的枸杞相结合，\n彷佛漫步在天堂的花园。", "以枸杞的健康效益为中心，补充绿茶\n的清新，一款长寿饮品。", "营养的枸杞与芳香的茉莉混合，\n曾是皇室的首选饮料。", "纯茉莉花茶，花香浓郁且令人舒适，\n以其宁静的特质和愉悦的香气而闻名。", "专为饮用枸杞精酿，象征学者的高贵与长寿。"]
    }
    else if (current_scene == 3)
    {
        list_drink_material = ["威士忌", "朗姆酒", "苦艾酒"]
        drink_menu = ["罗伯特·罗伊", "生锈的钉子", "完美曼哈顿", "古巴老人", "黑暴风", "缆车", "迈泰", "内格罗尼", "老广场", "种植者的冲击"]
        drink_descrip = ["基于苏格兰威士忌的经典鸡尾酒，\n简单却优雅。", "将威士忌和朗姆酒混合，结合甜味\n与力量。", "曼哈顿鸡尾酒的变种，平衡苦艾酒\n与威士忌。", "混合经典的古巴风味与威士忌和\n苦艾酒。", "朗姆酒的深邃迷人风味。", "灵感来自旧金山的缆车，结合朗姆酒\n和威士忌。", "经典的热带风味鸡尾酒，美妙地混合\n了朗姆酒和苦艾酒。", "经典的意大利鸡尾酒，以苦艾酒为主，\n味道甘苦。", "来自新奥尔良的经典鸡尾酒，复杂且\n深邃。", "传统的加勒比鸡尾酒，以其大胆的风味\n和浓郁的口感而闻名。"]
    }
    else if (current_scene == 4)
    {
        list_drink_material = ["草药", "浆果", "葡萄酒"]
        drink_menu = ["草药师之酿", "浆果木甘露", "僧侣珍藏", "酿酒师的浆果草稿", "男爵混合", "浆果狂欢", "古韵天鹅绒", "园丁混合", "药剂师的灵药", "丰收佳酿"]
        drink_descrip = ["由三种精选草药精制而成，这款补品因其\n药用和振奋精神的品质而备受推崇。", "一种茂盛的，清爽的混合饮料，结合了\n成熟的浆果和一点草药精华，唤起了森林的新鲜感。", "神圣的配方将草药的神圣与修道院陈年\n葡萄酒的丰富相结合。", "一种活力十足的饮品，在浆果的多汁\n口感与精致的葡萄酒之间取得了\n完美平衡。", "一种高贵的混合饮品，带有葡萄酒的\n浓郁和浆果的清香，适合贵族享用。", "一种浆果的纯粹庆典，这款饮料是一场\n自然甜味的狂欢。", "一种精心挑选的年份混合，旨在提供\n丰富层次感和奢华口感。", "一种质朴的，令人愉悦的混合饮料，\n捕捉了精心打理的花园和优质葡萄酒的\n精华。", "一种强效的混合饮品，以其助消化和\n舒缓特性而闻名，灵感来自传统的\n药剂配方。", "拥抱丰收的果实，这种混合饮品展示了\n成熟浆果的完整风味，并带有\n葡萄酒的余韵。"]
    }
    else if (current_scene == 5)
    {
        list_drink_material = ["电解质水", "蛋白浓缩液", "维生素果冻"]
        drink_menu = ["电解光波", "蛋白脉冲", "微重力震荡", "维生素幻彩", "能量晶体", "多光谱果冻", "抗辐射饮料", "感应果冻", "生物反馈液", "太空甜点"]
        drink_descrip = ["这款饮料使用了一种特殊的电解质平衡配方，\n在光照下能够发光，增强夜间活动的安全性。", "利用纳米技术使蛋白质在体内迅速吸收，适合\n高强度太空任务后快速补充能量。", "加入了微纳米气泡，能在微重力环境中产生\n有趣的震荡效果，提供独特的饮用体验。", "这款饮料含有可根据酸碱度变化颜色的维生素\n果冻，让宇航员可以视觉上监控维生素摄入。", "特殊的蛋白质结晶形态可以缓慢溶解，持续\n释放能量和营养，适合长时间任务。", "每种颜色的果冻代表不同的营养谱，宇航员\n可以根据需要选择颜色，直观了解所需营养。", "加入特殊的抗辐射成分，帮助宇航员减少太空\n中的辐射伤害，同时提供力量增强。", "这款饮料可以根据宇航员的身体状态自动调节\n甜度和口感，最优化地补充能量和营养。", "含有生物反馈传感器，能实时监测并调整饮品中\n的营养成分，以适应宇航员的具体需求。", "设计模仿地球上的甜点，提供熟悉的味道和\n舒适感，同时富含营养。"]
    }
    else if (current_scene == 6)
    {
        list_drink_material = ["维度精华", "心灵之光", "怀旧汽水"]
        drink_menu = ["维度之门", "心灵封印", "梦境穿梭", "超感探测", "时光倒流", "复古泡泡", "心灵触感", "时空裂隙", "暗影回响", "记忆觉醒"]
        drink_descrip = ["由三重维度精华调制而成，探索未知维度的\n神秘力量。", "强化心灵防御，抵御外部精神干扰，同时\n带来令人怀念的风味。", "结合维度精华的神秘与心灵之光的感知，\n如同自由穿梭于梦境与现实之间。", "以怀旧汽水为基底，辅以维度精华，增强\n对超自然现象的感知能力。", "微妙的心灵之光与复古汽水交织，让人\n回到美好的过去，重温旧日时光。", "充满 1980 年代特色的汽水，带来清爽\n而怀旧的味道。", "纯由心灵之光调制，可提升精神感知，\n使饮者能够察觉周围的情绪与思维。", "融合三种材料，创造出一款能够撕裂\n时空的神秘饮品。", "两份怀旧汽水与一份维度精华的混合，\n入口后可感受到来自异次元的回响。", "两份维度精华与心灵之光的强大结合，\n唤醒深层记忆与潜藏能力。"]
    }
}

