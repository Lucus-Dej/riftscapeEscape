item = noone;

bought = false;
price = 999;

item = rollItem(true, itemSearchType.basic);
price = findItemRarity(item)*3+2;
var newItem = instance_create_layer(x, y, "Items", item, {price: price, RoomID: RoomID})
newItem.shopItem = true;