import functions

def main():
    # Hardcoded dummy inventory data for CI/CD testing
    inventory = [
        {
            "id": 1,
            "type": "ring",
            "category": "gold",
            "cost_price": 300.00,
            "selling_price": None,
            "status": "available"
        },
        {
            "id": 2,
            "type": "bracelet",
            "category": "silver",
            "cost_price": 150.00,
            "selling_price": 200.00,
            "status": "sold"
        },
        {
            "id": 3,
            "type": "necklace",
            "category": "gold",
            "cost_price": 500.00,
            "selling_price": None,
            "status": "available"
        },
        {
            "id": 4,
            "type": "ring",
            "category": "silver",
            "cost_price": 120.00,
            "selling_price": 180.00,
            "status": "sold"
        }
    ]

    # Calculate and print profit summary
    profit_summary = functions.calculate_profit_summary(inventory)
    print("\nProfit Summary:")
    print(f"Total Cost (All Items): ${profit_summary['total_cost_all']}")
    print(f"Total Cost (Available): ${profit_summary['total_cost_available']}")
    print(f"Total Cost (Sold): ${profit_summary['total_cost_sold']}")
    print(f"Total Revenue: ${profit_summary['total_revenue']}")
    print(f"Total Profit: ${profit_summary['total_profit']}")
    print("Profit per sold item:")
    for item in profit_summary['profit_per_item']:
        print(f"ID: {item['id']}, Type: {item['type']}, Profit: ${item['profit']}")

if __name__ == "__main__":
    main()
