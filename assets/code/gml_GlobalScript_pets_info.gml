function pets_info() //gml_Script_pets_info
{
    pets = [
    {
        category: "Cat",
        spr_icon: spr_icon_cat,
        animals: [
        {
            name: ["orange kitten", "橙色小猫", "オレンジキトゥン", "橙色小貓", "Chaton orange", "Оранжевый котенок", "오렌지 키튼", "Orangen-Kätzchen", "Gatito naranja", "Gattino arancione", "Gatinho laranja"],
            sprite: spr_cat,
            price: 0
        }, 
        {
            name: ["Fore", "Fore", "Fore", "Fore", "Fore", "Fore", "Fore", "Fore", "Fore", "Foreo", "Fore"],
            sprite: spr_cat_cyberpunk,
            price: 0
        }, 
        {
            name: ["white kitten", "白色小猫", "ホワイトキトゥン", "白色小貓", "Chaton blanc", "Белый котенок", "화이트 키튼", "Weißes Kätzchen", "Gatito blanco", "Gattino bianco", "Gatinho branco"],
            sprite: spr_cat_white,
            price: 150
        }, 
        {
            name: ["Brown tabby", "棕色虎斑猫", "ブラウンタビー", "棕色虎斑貓", "Tabby brun", "Коричневый табби", "브라운 태비", "Braun-getigerte Katze", "Tabby marrón", "Tabby marrone", "Tabby castanho"],
            sprite: spr_cat_brown_tabby,
            price: 300
        }, 
        {
            name: ["Ragdoll", "布偶猫", "ラグドール", "布偶貓", "Ragdoll", "Рэгдолл", "래그돌", "Ragdoll", "Ragdoll", "Ragdoll", "Ragdoll"],
            sprite: spr_cat_doll,
            price: 500
        }, 
        {
            name: ["Ragdoll", "布偶猫", "ラグドール", "布偶貓", "Ragdoll", "Рэгдолл", "래그돌", "Ragdoll", "Ragdoll", "Ragdoll", "Ragdoll"],
            sprite: spr_cat_blackdoll,
            price: 550
        }, 
        {
            name: ["Volt", "伏特", "ボルト", "伏特", "Volt", "Вольт", "볼트", "Volt", "Voltio", "Volt", "Volt"],
            sprite: spr_cat_cyber,
            price: 600
        }, 
        {
            name: ["Crystal", "水晶", "クリスタル", "水晶", "Cristal", "Кристалл", "크리스탈", "Kristall", "Cristal", "Cristallo", "Cristal"],
            sprite: spr_cat_cyber2,
            price: 650
        }, 
        {
            name: ["Stardust", "星尘", "スターダスト", "星塵", "Poussière d'étoile", "Звездная пыль", "스타더스트", "Sternenstaub", "Polvo de estrellas", "Polvere di stelle", "Poeira estelar"],
            sprite: spr_cat_black,
            price: 700
        }]
    }
, 
    {
        category: "dog",
        spr_icon: spr_icon_dog,
        animals: [
        {
            name: ["Beagle", "比格犬", "ビーグル", "比格犬", "Beagle", "Бигль", "비글", "Beagle", "Beagle", "Beagle", "Beagle"],
            sprite: spr_beagle,
            price: 200
        }, 
        {
            name: ["Husky", "哈士奇", "ハスキー", "哈士奇", "Husky", "Хаски", "허스키", "Husky", "Husky", "Husky", "Husky"],
            sprite: spr_husky,
            price: 250
        }, 
        {
            name: ["Bordie", "波迪", "ボーディ", "波迪", "Bordie", "Борди", "보디", "Bordie", "Bordie", "Bordie", "Bordie"],
            sprite: spr_border,
            price: 250
        }]
    }
, 
    {
        category: "Ducky",
        spr_icon: spr_icon_duck,
        animals: [
        {
            name: ["Call Duck", "柯尔鸭", "コールダック", "柯爾鴨", "Canard de Call", "Колл-утка", "콜 덕", "Callente", "Pato Call", "Anatra Call", "Pato Call"],
            sprite: spr_call_duck,
            price: 200
        }, 
        {
            name: ["Chick", "小鸡", "ヒヨコ", "小雞", "Poussin", "Цыпленок", "병아리", "Küken", "Pollito", "Pulcino", "Pintinho"],
            sprite: spr_call_chick,
            price: 500
        }]
    }
, 
    {
        category: "Turtle",
        spr_icon: spr_icon_turtle,
        animals: [
        {
            name: ["Shelly", "小龟", "シェリー", "小龜", "Petite tortue", "Маленькая черепаха", "작은 거북이", "Kleine Schildkröte", "Tortuga pequeña", "Piccola tartaruga", "Pequena tartaruga"],
            sprite: spr_turtle,
            price: 300
        }, 
        {
            name: ["Lizard", "蜥蜴", "トカゲ", "蜥蜴", "Lézard", "Ящерица", "도마뱀", "Eidechse", "Lagarto", "Lucertola", "Lagarto"],
            sprite: spr_lizard1,
            price: 300
        }, 
        {
            name: ["Little Snake", "小蛇", "小さな蛇", "小蛇", "Petit serpent", "Маленькая змея", "작은 뱀", "Kleine Schlange", "Serpiente pequeña", "Piccolo serpente", "Pequena cobra"],
            sprite: spr_snake,
            price: 100
        }]
    }
, 
    {
        category: "Small animals",
        spr_icon: spr_icon_hamster,
        animals: [
        {
            name: ["Pudding", "布丁", "プリン", "布丁", "Pudding", "Пуддинг", "푸딩", "Pudding", "Pudín", "Budino", "Pudim"],
            sprite: spr_pudding,
            price: 300
        }, 
        {
            name: ["hedgehog", "刺猬", "ハリネズミ", "刺蝟", "hérisson", "ёж", "고슴도치", "Igel", "erizo", "riccio", "ouriço"],
            sprite: spr_porcupine,
            price: 400
        }]
    }
]
}

