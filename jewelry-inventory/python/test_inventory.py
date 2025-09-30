import pytest
from functions import add_jewelry_item, mark_item_sold

def test_add_jewelry_item():
    inventory = []
    updated_inventory, new_item = add_jewelry_item(inventory, "Ring", "Gold", 250.0)
    assert len(updated_inventory) == 1
    assert new_item['type'] == "Ring"

def test_mark_item_sold():
    inventory = [{"id": 1, "type": "Necklace", "category": "Silver", "cost_price": 100.0, "selling_price": None, "status": "available"}]
    updated_inventory, sold_item = mark_item_sold(inventory, 1, 150.0)
    assert sold_item['status'] == "sold"
    assert sold_item['selling_price'] == 150.0
