create database netShop;
use netShop;

create table `address`(
`id` int(10) unsigned not null auto_increment primary key,
`country` varchar(255) not null,
`street` varchar(255) not null
);

create table `costumer`(
`id` int(10) unsigned not null auto_increment primary key,
`name` varchar(255) not null,
`address_id` int(10) unsigned not null,
constraint `address_id` foreign key (`address_id`) references `address` (`id`)  ON DELETE CASCADE ON UPDATE CASCADE
);

create table `orders` (
`id` int(10) unsigned not null auto_increment primary key,
`costumer_id` int(10) unsigned not null,
`order_time` datetime,
`total_price` float,
constraint `costumer_id` foreign key (`costumer_id`) references `costumer` (`id`)
);

create table `product`(
`id` int(10) unsigned not null auto_increment primary key,
`name` varchar(255) not null
);

create table `line_item`(
`order_id` int(10) unsigned not null,
`product_id` int(10) unsigned not null,
`price` float,
`quantity` int(10),
primary key(`order_id`, `product_id`)  ,
constraint `order_id` foreign key(`order_id`) references `orders` (`id`),
constraint `product_id` foreign key(`product_id`) references `product` (`id`)
);


insert into product (name) values ('pen');
insert into product (name) values ('pencil');
insert into product (name) values ('note book');
insert into product (name) values ('headphone');
insert into product (name) values ('sticker');
insert into product (name) values ('marcker');


insert into address (country, street) values ('UK', '221B Baker Street');
insert into address (country, street) values ('Denmark', 'østre alle');
insert into address (country, street) values ('USA', 'Wall str.');

insert into costumer (name, address_id) values ('Sherlock Holmes', 1);
insert into costumer (name, address_id) values ('John Doe', 2);
insert into costumer (name, address_id) values ('Donald duck', 3);

insert into orders (costumer_id, order_time, total_price) values (2, now(), 495);
insert into orders (costumer_id, order_time, total_price) values (1, now()-4, 0.99);
insert into orders (costumer_id, order_time, total_price) values (3, now(), 11);
insert into orders (costumer_id, order_time, total_price) values (2, now(), 6.50);

insert into line_item (order_id, product_id, price, quantity) values (2, 1,0.99, 1);
insert into line_item (order_id, product_id, price, quantity) values (1, 4,250, 2);
insert into line_item (order_id, product_id, price, quantity) values (3, 5,1.5, 5);