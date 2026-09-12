item = noone;

bought = false;
price = 999;

item = rollItem(true, itemSearchType.basic);
price = findItemRarity(item)*6;
var newItem = instance_create_layer(x, y, "Items", item, {price: price})
newItem.shopItem = true;