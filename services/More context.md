Nice! It worked!

Now while these responses are great. I noticed that perplexity lacks some context into repairability and product availability in Sierra Leone. While this is a continuous process, building up context as to which items are "compatible" with the user, I'll need some help figuring out the best prompt to guide Perplexity.

Let's take a look at the last run:
- Here's the cleaned response:
{
    "recommendations": [
        {
            "name": "Tecno Pop 5",
            "price": 180000,
            "repair_score": 8,
            "repairability": "high"
        },
        {
            "name": "Itel A18",
            "price": 170000,
            "repair_score": 8,
            "repairability": "high"
        },
        {
            "name": "Orange Sanza",
            "price": 150000,
            "repair_score": 7,
            "repairability": "high"
        }
    ]
}
- Now while this is great, it's missing some context:
1. I want it to recommend items that are available globally, and in terms of repairability, it should consider the following items:
    - High repairability items
    - Medium repairability items
    - Low repairability items
    - Items whose parts are available in Sierra Leone
    - Items whose parts are available in other countries

If the parts are not available in Sierra Leone, I want it to still recommend them if they fit the user's other criteria and just drop the repairability score. And if the parts are not available in other countries, I want it to drop the item completely. 

2. Apple, Samsung, Google, Logitech, Sony, Beats, JBL, LG and Bose are all major brands in Sierra Leone. I want it to recommend items from these brands where relevant.
Soundcore, Edifier, Xiaomi, Redmi, Oneplus, Huawei, Lenovo, Oppo, Vivo, and Realme are lesser known brands but through my research I've come to find that they also often produce good quality items. I want it to recommend items from these brands where relevant.


3. For items like aerosols, liquids, high capacity batteries and items that would normally be difficult/impossible to ship through air freight, I want it to recommend these items but identify them as "shipping" instead of "air freight". 

