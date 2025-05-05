
# Hotel Data Analysis with SQL

## Introduction

A hotel has granted access to its database which features various information concerning its order details. The database has two tables: `menu_items` and `order_details`. 

- The `menu_items` table features four columns:
    - `menu_item_id`: The unique identifier of the dish.
    - `item_name`: The name of the dish.
    - `category`: The origin of the dish, which could be American, Asian, or other regions.
    - `price`: The amount that the item costs.
  
- The `order_details` table has the following five columns:
    - `order_details_id`: A unique identifier for each item ordered.
    - `order_id`: A unique identifier for the order. A single order can have multiple items, meaning one `order_id` can have multiple `order_details_id` entries.
    - `order_date`: The date the order was made.
    - `order_time`: The time the order was made.
    - `menu_item_id`: Corresponds to the `menu_item_id` in the `menu_items` table.

## Analysis

### Menu_Items Table Exploration (`menu_exploration.sql`)

- The restaurant menu features 32 items, divided into four categories: 
  - Mexican (9 dishes)
  - Italian (9 dishes)
  - Asian (8 dishes)
  - American (6 dishes)

- The lowest-priced item is Edamame at $5, while the most expensive item is Shrimp Scampi at $19.95.

- Average pricing by category:
  - **American**: $10.07
  - **Italian**: $16.75

### Order_details Table Exploration (`order_exploration.sql`)

- The data spans from January 1, 2023, to March 31, 2023, with 5,370 total orders during this period.

- The largest orders had 14 items in total, while the average order had 2.25 items and the most common order size was 1 item.

### Menu_and_order_exploration Table Exploration

- The data was merged into a table called `detailed_orders`, featuring the following columns: 
  - `Order_details_id`
  - `order_id`
  - `order_date`
  - `order_time`
  - `item_id`
  - `item_name`
  - `category`
  - `price`

- Most ordered item: **Hamburger**
- Least ordered item: **Chicken Tacos**
- Most popular category: **Asian**
  - Followed by Italian, Mexican, and American.

- Peak order times: 
  - 12 PM to 2 PM and 4 PM to 8 PM.
  - Quieter periods: 10 AM and 10 PM to 11 PM.

- Customer attendance does not show a consistent pattern from day to day.

## Potential Recommendations

### Focus Marketing on High-Demand Items and Categories

- The **Hamburger** was the most ordered item, and **Asian cuisine** emerged as the most popular category overall.
- The restaurant should focus on marketing high-demand items and explore the attributes (seasoning, presentation, freshness) contributing to their popularity.

### Optimize the Menu by Reevaluating Underperforming Items

- The **Chicken Tacos** were the least ordered item.
  - The restaurant should evaluate the dish’s flavor, presentation, or pricing, and possibly remove it from the menu if improvements don't yield results.
- American cuisine was the least ordered category, suggesting it may need a revamp or streamlining.

### Leverage Order Patterns to Improve Kitchen Efficiency

- The average order size is 2.25 items, and the most common order size is 1.
  - The kitchen should optimize workflows for smaller, frequent orders and be prepared for occasional large orders (up to 14 items).

### Adjust Pricing Strategy Based on Category Performance

- American dishes are the least expensive on average, but also the least ordered, suggesting a need for better value perception.
- Italian dishes, despite being more expensive, were the most popular, signaling a willingness to pay for perceived quality. Consider adding premium Italian options or adjusting prices to align with customer expectations.

### Aligning Scheduling

- Peak times: 12 PM to 2 PM and 4 PM to 8 PM.
- Quiet times: 10 AM and 10 PM to 11 PM.
  - Optimize staffing schedules based on these time-based trends to improve operational efficiency and service quality.

## Conclusion

This analysis of the hotel restaurant’s data from Q1 2023 highlights both strengths and areas for improvement:
- The **Hamburger** and **Asian cuisine** stand out as high performers.
- Some dishes and categories require reevaluation or enhancement to better meet customer preferences.
- The restaurant experiences predictable peak hours, offering opportunities to optimize staffing and kitchen workflow.

By acting on these data-driven insights—refining the menu, aligning pricing with perceived value, and improving operational efficiency—the restaurant can enhance customer satisfaction and profitability. Ongoing monitoring will be essential to sustain success and adapt to customer preferences.
