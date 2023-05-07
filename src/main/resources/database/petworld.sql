drop database `petworld-v1`;
create database `petworld-v1`;

use `petworld-v1`;

create table product(
	`id`			bigint primary key auto_increment,
	`name`			varchar(100) not null,
	`description` 	longtext not null,
	`image` 		varchar(255) not null,
	`price` 		double(16,2) not null,
	`product_code` 	varchar(20) not null,
	`protein` 		varchar(200) not null,
	`fats` 			varchar(200) not null,
	`carbohydrates` varchar(200) not null,
	`minerals` 		varchar(200) not null,
	`vitamins` 		varchar(200) not null,
	`animal` 		varchar(200) not null,
	`status` 		bit not null check(`status` = 0 or `status` = 1),
    `category_id` 	bigint,
    `sale`          int default 0 check(`sale` >= 0 and `sale` <= 100)
);

create table category(
	`id`			bigint primary key auto_increment,
    `name`			varchar(40) not null unique
);

create table product_cart(
	`id` bigint primary key auto_increment
);

create table cart_detail(
	`product_cart_id` bigint,
	`product_id` bigint,
	primary key(`product_cart_id`, `product_id`)
);

ALTER TABLE cart_detail
ADD CONSTRAINT fk_cart_detail_product_cart
  FOREIGN KEY (`product_cart_id`)
  REFERENCES product_cart (`id`);
  
ALTER TABLE cart_detail
ADD CONSTRAINT fk_cart_detail_product
  FOREIGN KEY (`product_id`)
  REFERENCES product (`id`);
  
ALTER TABLE product
ADD CONSTRAINT fk_product_category
  FOREIGN KEY (`category_id`)
  REFERENCES category(`id`);
  
  
------------------------------------
INSERT INTO category(`name`)
VALUES
	('Food Toppers'),
	('Milk Replacers'),
	('Canned Food'),
	('Veterinary Authorized Diets'),
	('Bones & Rawhide');


INSERT INTO product (name, description, image, price, product_code, protein, fats, carbohydrates, minerals, vitamins, animal, status, category_id)
VALUES
('Beef pate for dogs', 'One care beef', 'https://www.petmart.vn/wp-content/uploads/2019/04/pate-cho-cho-vi-thit-bo-iris-one-care-beef100g-768x768.jpg', 35000, 'PATE01', '8g', '3g', '12g', '200mg', 'vitamin A, D, E, K', 'Beef', 1, 1),
('Beef bones for dogs', 'VEGEBRAND Orgo Nutrients Beef', 'https://www.petmart.vn/wp-content/uploads/2015/12/xuong-cho-cho-vi-thit-bo-le-vegebrand-orgo-nutrients-beef-768x768.jpg', 25000, 'BONES01', '5g', '2g', '25g', '50mg', 'vitamin B1, B2, B3, B6', 'Bones Beef', 1, 2),
('Dog milk powder', 'BBN Goat’s Milk New Zealand', 'https://www.petmart.vn/wp-content/uploads/2016/09/sua-bot-cho-bbn-goats-milk-new-zealand-768x768.jpg', 5000, 'MILK01', '1g', '0.5g', '30g', '100mg', 'vitamin C', '', 1, 3),
('Dog treats', 'JERHIGH Beef Stick', 'https://www.petmart.vn/wp-content/uploads/2016/04/banh-thuong-cho-cho-vi-thit-bo-jerhigh-beef-stick-768x768.jpg', 75000, 'THQ01', '20g', '15g', '5g', '50mg', 'vitamin B3, B6', 'Heo', 1, 4),
('Cat food', 'Cat Food - Kitcat Grain Food is produced and packaged according to international standards, the ingredients of the food are made from selected and high-grade raw materials. Food will be the most balanced and healthy source of nutrition for the cat to develop fully', 'https://bizweb.dktcdn.net/100/092/840/products/thuc-an-hat-kitcat-cho-meo-chicken-cuisine-goi-1-2kg.jpg?v=1669097725000', 25000, 'KITKAT01', '1g', '2g', '20g', '50mg', '', '', 1, 2),
('Hot dog for cats', 'Bioline Dog and Cat Sausage contains Vitamins & Minerals for the body of pets to be healthy and flexible. Fiber for a good digestive system, enhances the ability to absorb nutrients, contributes to the uniform development of pets.', 'https://bizweb.dktcdn.net/100/092/840/products/xuc-xich-bioline-cho-cho-meo-1-33a2e4e2-ed1c-44de-a216-90c5edf376e4.jpg?v=1669090960000', 65000, 'SHCG01', '15g', '10g', '5g', '50mg', 'vitamin B3', 'Heo', 1, 4),
('Pate for cats', 'Pate for Cats Kitcat Complete Cuisine is a wet food, ensuring enough nutrition, fiber, and minerals as a complete diet. The product is suitable for busy owners who do not have time to prepare complete meals for their cats', 'https://bizweb.dktcdn.net/100/092/840/products/thuc-an-dong-hop-kitcat-complete-cho-meo-12-vi.png?v=1669015221000', 55000, 'PATE02', '8g', '3g', '12g', '200mg', 'vitamin A, D, E, K', 'Beef', 1, 1),
('Cabbage', 'Vegetables contain a lot of fiber, vitamins and minerals, helping rabbits have a nutritionally complete diet.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_uAtOa-ViSMz7B77QqMM1cikd-p9xYu6IRA&usqp=CAU', 85000, 'RAU01', '8g', '3g', '12g', '200mg', 'vitamin A, D, E, K', 'cabbage01', 1, 1),
('Grass seed', 'Grass seeds are a suitable natural food source for rabbits. They contain a lot of fiber and essential nutrients to maintain the health of your rabbit', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRf2R4hT8A0AL7OYH_ydiB4vvDmnxUhN9D7g&usqp=CAU', 25000, 'GRASS01', '15g', '4g', '22g', '200mg', 'vitamin A, D, E, K', 'grass03', 1, 1),
('Hay for rabbits', 'Hay is a simple food option for rabbits. They contain a lot of fiber, which helps rabbits digest better. In addition, hay also helps rabbits reduce stress and eliminate boredom', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuKB-PDP6OBZqFOA1XxYtSyI9OdDZQMrwjGw&usqp=CAU', 65000, 'HAY01', '5g', '4g', '16g', '20mg', 'vitamin A, D, E, K', 'HAY', 1, 1),
('Coriander', 'Coriander is a vegetable with a delicious taste and rich in nutrients. Rabbits often love coriander and they can help strengthen the rabbits immune system', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvt1RTgzCFLku-ME87YWu23Mnr3WOiInWbZg&usqp=CAU', 45000, 'Coriander01', '8g', '3g', '22g', '200mg', 'vitamin A, D, E, K', 'Coriander', 1, 1),
('Sugar beet', 'Beets are a nutritious and high fiber vegetable. They help rabbits digest better and can help improve their heart health', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkOGTGkD5vGjppgoLH6zYcxfJCqcz6ks1Q-6GUZ-OdRK4tPWaouKYp4057NLSi8B7zPCw&usqp=CAU', 35000, 'SUGERBEET01', '6g', '5g', '12g', '210mg', 'vitamin A, D, E, K', 'SugerBeet', 1, 1);

Select * from product, category where product.category_id = category.id;
