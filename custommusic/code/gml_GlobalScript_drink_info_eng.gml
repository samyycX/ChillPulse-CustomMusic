function drink_info_eng() //gml_Script_drink_info_eng
{
    if (current_scene == 0)
    {
        list_drink_material = ["Milk", "Coffee", "Sirop"]
        drink_menu = ["Harmony Cup", "Espresso Intenso", "Milk", "Velvet Espresso", "Dulce Brew", "Honeyed Light", "Cloudy Comfort", "Syruped Silk", "Cream Cascade", "Sweet Essence"]
        drink_descrip = ["A perfectly balanced blend of coffee, milk, and a touch of sweetness, harmonizing all flavors.", "A pure, strong shot of espresso for those who appreciate the uncompromised taste of coffee.", "Just hot milk", "Smooth and creamy, this drink combines the rich depth of coffee with the velvety texture of milk.", "A bold coffee softened with a hint of sweetness, ideal for a gently uplifting experience.", "Lightly caffeinated and sweetly flavored, perfect for those who enjoy a softer coffee touch.", "A comforting, creamy milk drink with a sweet finish, ideal for relaxing moments.", "Silky smooth milk enriched with double syrup for a luxuriously sweet taste.", "A cascade of creamy milk flows over a base of rich coffee, creating a lush, smooth texture.", "An intense, syrup-only concoction for those who savor the pure, sweet essence."]
    }
    else if (current_scene == 1)
    {
        list_drink_material = ["Spirit", "Juice", "Liquor"]
        drink_menu = ["Circuit Breaker", "Bad Touch", "Cyber Mist", "Photon Blast", "Piano Man", "Moonblast", "Chrome Night", "Electro Buzz", "Data Stream", "Neural Sync"]
        drink_descrip = ["A drink that disrupts the senses, offering a taste of the rebellion against the digital overlords.", "Alma wants a… pffft… a Bad Touch.", "A mysterious and enigmatic cocktail, its silver essence evoking the foggy uncertainty of the future.", "A sharp and refreshing cocktail, with a luminescent quality that seems to charge with energy.", "A weird drink. Hm… Promo drinks fit that bill, easily", "Something small, sweet, and icy.", " A cool and sleek drink for the urban night crawler, reflecting the city's metallic sheen under the moonlight.", "A drink with a potent kick, energizing the drinker for a night of hacking and exploration.", "A smooth and flowing cocktail, symbolizing the endless flow of information in the cyber realm.", "A pure, undiluted shot of Neon Liquor, for those looking to connect directly to the neon grid."]
    }
    else if (current_scene == 2)
    {
        list_drink_material = ["Green Tea", "Jasmine", "Goji"]
        drink_menu = ["Jade Breeze", "Jasmine Dawn", "Elixir of Immortality", "Trinity Blossom", "Dragon Maiden", "Royal Nectar", "Beauty Remnant", "Imperial Secret", "Moonlit Blossoms", "Scholar’s Orchid"]
        drink_descrip = ["Pure green tea enjoyment, refreshing and rejuvenating, a favorite among ancient scholars and poets.", "A base of green tea with a touch of jasmine fragrance, fresh and elegant with a gentle floral scent.", "A nourishing combination of goji berries and the fresh aroma of green tea, offering both health and vitality.", "A perfect harmony of three ingredients, symbolizing a balance and unity of flavors.", "Dominantly fragrant jasmine with a base of green tea, lingering like the touch of an ancient beauty playing the guqin.", "Fragrant jasmine paired with sweet goji berries, enhancing each other, akin to wandering through a heavenly garden.", "Focused on the health benefits of goji berries complemented by the freshness of green tea, a drink for longevity.", "A nutritional blend of goji with the aromatic jasmine, once a royal beverage of choice.", "Pure jasmine tea, intensely floral and soothing, celebrated for its serene qualities and delightful aroma.", "Exclusively brewed from goji berries, symbolizing the nobility and longevity of a scholar."]
    }
    else if (current_scene == 3)
    {
        list_drink_material = ["Whiskey", "Rum", "Vermouth"]
        drink_menu = ["Rob Roy", "Rusty Nail", "Perfect Manhattan", "Old Cuban", "Dark 'n' Stormy", "Cable Car", "Mai Tai", "Negroni", "Vieux Carre", "Planter’s Punch"]
        drink_descrip = ["A classic cocktail based on Scotch whiskey, simple yet elegant.", "A blend of whiskey and rum, combining sweetness with strength.", "A variant of the Manhattan cocktail, balancing vermouth with whiskey.", "Mixing classic Cuban flavors with whiskey and vermouth.", "The power of rum, deep and captivating.", "Inspired by San Francisco's cable cars, combining rum and whiskey.", "A classic tropical flavor, wonderfully blending rum and vermouth.", "A classic Italian cocktail dominated by vermouth, bittersweet.", "A classic cocktail from New Orleans, complex and profound.", "A traditional Caribbean cocktail, known for its bold flavors and robust taste."]
    }
    else if (current_scene == 4)
    {
        list_drink_material = ["Herbs", "Berries", "Wine"]
        drink_menu = ["Herbalist's Brew", "Berrywood Nectar", "Monk's Reserve", "Vintner's Berry Draft", "Baron's Blend", "Berry Jubilee", "Vintage Velvet", "Gardener's Blend", "Apothecary's Elixir", "Fruitful Harvest"]
        drink_descrip = ["Crafted from a trio of fine herbs, this tonic is revered for its medicinal and revitalizing qualities.", "A lush, refreshing blend of ripe berries and a touch of herbal essence, evoking woodland freshness.", "A sacred recipe blending the sanctity of herbs with the richness of monastery-aged wine.", "A vibrant concoction where the juiciness of berries meets the sophistication of fine wine.", "A noble mix with the boldness of wine and a hint of berry, fit for aristocracy.", "A celebration of berries in their purest form, this drink is a festival of natural sweetness.", "An exquisite blend of selected vintages, crafted to deliver a layered and luxurious taste.", "An earthy, delightful mix that captures the essence of a well-tended garden and fine wine.", "A potent concoction esteemed for its digestive and soothing properties, inspired by traditional apothecary recipes.", "Embracing the bounty of the harvest, this blend showcases the full flavor of ripe berries with a wine finish."]
    }
    else if (current_scene == 5)
    {
        list_drink_material = ["Electrolyte Water", "Protein Concentrate", "Vitamin Jelly"]
        drink_menu = ["Electrolyte Glow", "Protein Pulse", "Microgravity Oscillation", "Vitamin Chromatics", "Energy Crystals", "Multispectrum Jelly", "Radiation Shield", "Sensory Jelly", "Biofeedback Fluid", "Space Dessert"]
        drink_descrip = ["This beverage uses a special electrolyte balance formula that glows under light, enhancing safety during nighttime activities.", "Utilizes nanotechnology to allow for rapid absorption of protein in the body, ideal for quick energy replenishment after high-intensity space tasks.", "Infused with micro-nanobubbles that create interesting oscillation effects in a microgravity environment, offering a unique drinking experience.", "This beverage contains color-changing vitamin jelly that shifts hues based on pH levels, allowing astronauts to visually monitor their vitamin intake.", "Features special crystalline forms of protein that dissolve slowly, continuously releasing energy and nutrients, suitable for long-duration tasks.", "Each color of the jelly represents a different nutritional spectrum, allowing astronauts to choose based on their nutritional needs.", "Incorporates special anti-radiation components to help reduce radiation damage in space, while also providing a boost in strength.", "This beverage automatically adjusts its sweetness and texture according to the astronaut's bodily state, optimally replenishing energy and nutrients.", "Contains biofeedback sensors that can monitor and adjust the nutritional content in real-time to meet the specific needs of astronauts.", "Designed to resemble and taste like a dessert from Earth, providing comfort and familiarity while being rich in nutrients."]
    }
}

