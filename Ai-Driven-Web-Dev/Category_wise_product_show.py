'''
Step 1: Create a list of dictionaries for products.
Step 2: Take category input from the user.
Step 3: Create an empty list to store matched products.
Step 4: Apply a for loop to the products list.
Step 5: If the product category matches the searched category,
        append the product to the matched products list.
Step 6: If the matched products list is empty,
        show "Category Not Found".
Step 7: Otherwise, display the matched products list.
'''

products = [

    {
        "product_name": "HY300 Mini Projector",
        "category": "Other Projector Accessories",
        "price": 8500,
        "description": "Portable Mini Projector"
    },
    {
        "product_name": "Projector Remote",
        "category": "Other Projector Accessories",
        "price": 800,
        "description": "Wireless Projector Remote"
    },

    {
        "product_name": "Wireless Mouse",
        "category": "Other Electronic Gadgets",
        "price": 1200,
        "description": "2.4GHz USB Wireless Mouse"
    },
    {
        "product_name": "USB Hub",
        "category": "Other Electronic Gadgets",
        "price": 950,
        "description": "4-Port USB Hub"
    },

    {
        "product_name": "Bluetooth Speaker",
        "category": "Home Audio Accessories",
        "price": 3500,
        "description": "Portable Bluetooth Speaker"
    },
    {
        "product_name": "Sound Bar",
        "category": "Home Audio Accessories",
        "price": 6500,
        "description": "Home Theater Sound Bar"
    },

    {
        "product_name": "LED Strip Light",
        "category": "Other Lighting Parts",
        "price": 950,
        "description": "RGB LED Strip Light"
    },
    {
        "product_name": "LED Bulb",
        "category": "Other Lighting Parts",
        "price": 300,
        "description": "12W LED Bulb"
    },

    {
        "product_name": "PS5 Controller",
        "category": "Console Accessories",
        "price": 6500,
        "description": "Wireless Gaming Controller"
    },
    {
        "product_name": "Controller Charging Dock",
        "category": "Console Accessories",
        "price": 1800,
        "description": "Dual Charging Dock"
    },

    {
        "product_name": "Microfiber Cleaning Cloth",
        "category": "Others",
        "price": 150,
        "description": "Soft Cleaning Cloth"
    },
    {
        "product_name": "Universal Adapter",
        "category": "Others",
        "price": 650,
        "description": "Universal Power Adapter"
    },

    {
        "product_name": "Ceiling Projector Mount",
        "category": "Projector Mounts",
        "price": 1800,
        "description": "Adjustable Ceiling Mount"
    },
    {
        "product_name": "Wall Projector Mount",
        "category": "Projector Mounts",
        "price": 2200,
        "description": "Heavy Duty Wall Mount"
    },

    {
        "product_name": "Toy Car",
        "category": "Toy Dolls",
        "price": 750,
        "description": "Remote Control Toy Car"
    },
    {
        "product_name": "Barbie Doll",
        "category": "Toy Dolls",
        "price": 1450,
        "description": "Fashion Doll"
    },

    {
        "product_name": "VGA Cable 3 Meter",
        "category": "VGA Cables",
        "price": 450,
        "description": "High Speed VGA Cable"
    },
    {
        "product_name": "VGA to HDMI Converter",
        "category": "VGA Cables",
        "price": 900,
        "description": "VGA to HDMI Adapter"
    },

    {
        "product_name": "Xbox Charging Dock",
        "category": "Xbox Other Accessories",
        "price": 2200,
        "description": "Dual Controller Charging Dock"
    },
    {
        "product_name": "Xbox Wireless Headset",
        "category": "Xbox Other Accessories",
        "price": 4800,
        "description": "Gaming Headset"
    },

    {
        "product_name": "Kitchen Storage Rack",
        "category": "Kitchen Organizers",
        "price": 1500,
        "description": "Multi-purpose Storage Rack"
    },
    {
        "product_name": "Spice Organizer",
        "category": "Kitchen Organizers",
        "price": 950,
        "description": "Kitchen Spice Rack"
    }

]