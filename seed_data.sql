INSERT INTO customers(customer_id, first_name, last_name, email, city, signup_date) VALUES
(1,'Anita','Sharma','anita.sharma@example.com','Bengaluru','2024-01-10'),
(2,'Raj','Patel','raj.patel@example.com','Chennai','2024-02-15'),
(3,'Sneha','Verma','sneha.verma@example.com','Mumbai','2024-03-05'),
(4,'John','Doe','john.doe@example.com','Delhi','2024-04-01'),
(5,'Asha','Narayan','asha.narayan@example.com','Hyderabad','2024-05-12');

INSERT INTO products(product_id, name, category, price) VALUES
(1,'Wireless Mouse','Accessories',15.50),
(2,'USB-C Cable','Accessories',8.99),
(3,'Noise-cancelling Headphones','Electronics',79.99),
(4,'Portable Charger','Accessories',25.00),
(5,'Mechanical Keyboard','Electronics',99.99);

INSERT INTO orders(order_id, customer_id, order_date, status, total_amount) VALUES
(1,1,'2024-06-01','completed',51.49),
(2,2,'2024-06-03','completed',25.00),
(3,1,'2024-06-10','completed',99.99),
(4,3,'2024-06-12','cancelled',8.99),
(5,5,'2024-06-14','completed',124.99);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1,1,1,1,15.50),
(2,1,2,1,8.99),
(3,1,4,1,25.00),
(4,2,4,1,25.00),
(5,3,5,1,99.99),
(6,4,2,1,8.99),
(7,5,3,1,79.99),
(8,5,2,5,8.80);
