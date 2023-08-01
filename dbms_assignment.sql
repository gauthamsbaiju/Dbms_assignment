drop table 'user';
drop table product;




create table public."user_details" ("created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null,
"phone_number" character varying not null,
"email" character varying not null,
"password" character varying not null,
constraint "PK_user_details" primary key ("id"));

create table public."product" ("created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null,
"description" character varying not null,
"price" float not null,
"sku" character varying not null unique,
"product category" character varying not null,
constraint "PK_product" primary key ("id"));

create table public."address" ("created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"user_id" uuid not null,
"address_line_1" character varying not null,
"address_line_2" character varying not null,
"address_line_3" character varying not null,
"pincode" character varying not null,
constraint "PK_address" primary key ("id"),
constraint "FK_address" foreign key ("user_id") references user_details("id"));

create table public."order_details" ("created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"ordered_user_id" uuid not null,
"address_id" uuid not null,
"price" float not null,
"count" float not null,
constraint "PK_order_details" primary key ("id"),
constraint "FK_order_details" foreign key ("ordered_user_id") references user_details("id"));

drop table "order" ;
drop table "user" ;

create table public."order_product" (
"order_id" uuid not null,
"product_id" uuid not null,
constraint "FK_order_product" foreign key ("order_id") references order_details("id"),
constraint "FK_order_product2" foreign key ("product_id") references product("id"));

alter table order_details drop constraint "FK_order_details3" ;

INSERT INTO public.user_details
(created_at, updated_at, deleted_at, id, "name", phone_number, email, "password")
VALUES(now(), now(), '', uuid_generate_v4(), 'Abc', '123456789', 'abc@gmail.com', 'bca');

alter table order_product add count float not null;

INSERT INTO public.user_details
(created_at, updated_at, id, "name", phone_number, email, "password")
VALUES(now(), now(), uuid_generate_v4(), 'Abc', '123456789', 'abc@gmail.com', 'bca'),
(now(), now(), uuid_generate_v4(), 'Def', '987654321', 'def@yahoo.com', 'fed'),
(now(), now(), uuid_generate_v4(), 'ghi', '123456789', 'ghi@gmail.com', 'ihg');

select * from user_details ud ;

INSERT INTO public.address
(created_at, updated_at, id, user_id, address_line_1, address_line_2, address_line_3, pincode)
VALUES(now(), now(), uuid_generate_v4(), '34cc9022-65ba-40f2-bae9-691840f64cd3', 'DLF City', 'Phase 1 , Block C', 'Gurugram', '352723'),
(now(), now(), uuid_generate_v4(), '6b267a3f-e2a5-4c71-aa87-0c8c5fc2f11b', '19-A, Perry Cross Road', 'Bandra (West), Mumbai', 'Maharashtra', '189723'),
(now(), now(), uuid_generate_v4(), '6193ac4f-c408-48be-ab2f-6e93f655c87a', 'DLF City', 'Phase 2 , Block A', 'Gurugram', '352723');

select * from address ud ;

INSERT INTO public.product
(created_at, updated_at, id, "name", description, price, sku, "product category")
VALUES(now(), now(), uuid_generate_v4(), 'Earphone', 'Boat wireless earphones', 1000, 'K001', 'Electronics'),
(now(), now(), uuid_generate_v4(), 'Laptop', 'Asus gaming laptop', 60000, 'K002', 'Electronics'),
(now(), now(), uuid_generate_v4(), 'Shoes', 'Nike white running shoes', 3500, 'K003', 'Footwear'),
(now(), now(), uuid_generate_v4(), 'Tshirt', 'Puma blue sleeveless shirt', 2700, 'K004', 'Clothes'),
(now(), now(), uuid_generate_v4(), 'Jogger', 'Adidas black joggers', 1400, 'K005', 'Clothes');

select * from product p  ;

INSERT INTO public.order_details
(created_at, updated_at, id, ordered_user_id, address_id, price, count)
VALUES(now(), now(), uuid_generate_v4(), '34cc9022-65ba-40f2-bae9-691840f64cd3', 'cb0977aa-ab78-454f-829b-bb9252bb059c', 61000, 2),
(now(), now(), uuid_generate_v4(), '34cc9022-65ba-40f2-bae9-691840f64cd3', 'cb0977aa-ab78-454f-829b-bb9252bb059c', 4900, 2),
(now(), now(), uuid_generate_v4(), '6b267a3f-e2a5-4c71-aa87-0c8c5fc2f11b', '29df2944-e589-49e5-8258-14e016c772b2', 2400, 2),
(now(), now(), uuid_generate_v4(), '6b267a3f-e2a5-4c71-aa87-0c8c5fc2f11b', '29df2944-e589-49e5-8258-14e016c772b2', 60000, 1),
(now(), now(), uuid_generate_v4(), '6193ac4f-c408-48be-ab2f-6e93f655c87a', '62e50290-52d4-41b7-93f8-e5ac78eb8ec3', 2700, 1);

select * from order_details;

INSERT INTO public.order_product
(order_id, product_id, count)
VALUES('780a5777-cf91-4ea0-8721-11718469cb52', 'f0e1dca6-f977-469e-9c04-f4b0223cb05d', 1),
('780a5777-cf91-4ea0-8721-11718469cb52', '54289522-7036-4498-96ba-9592d03bc913', 1),
('9a3ae5be-345c-4994-9073-171d1a2faab5', 'ad3bb09b-c7ab-493a-ad53-6548bfef29f5', 1),
('9a3ae5be-345c-4994-9073-171d1a2faab5', '2690b029-51d1-4ebd-b4c9-abd19cd96cfb', 1),
('b333c8be-5bab-4086-8f78-08a17c243902', '54289522-7036-4498-96ba-9592d03bc913', 1),
('b333c8be-5bab-4086-8f78-08a17c243902', '2690b029-51d1-4ebd-b4c9-abd19cd96cfb', 1),
('cccce6b1-347c-4f96-8cef-204ac9dcc54c', 'f0e1dca6-f977-469e-9c04-f4b0223cb05d', 1),
('e2f96ad9-8869-4c23-82e6-7b01dcc97c32', '0eb10604-fcce-461f-b5c5-ba6569cf35af', 1);

create index prod_name on product ("name");

create index prod_cat on product ("product category");

create index prod_price on product ("price");

create index order_details_id on order_details ("ordered_user_id");

alter table user_details rename to user_detail;
alter table order_details rename to "order";

alter table "order" alter column count type int;
alter table order_product alter column count type int;

create table public."product_category" ("created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"category" character varying not null,
constraint "PK_cat" primary key ("id"));

INSERT INTO public.product_category
(category)
VALUES('Appliances'),
('Books'),
('Clothes'),
('Electronics'),
('Footwear'),
('Grocery');

alter table product add column product_category_id uuid;

update public.product set product_category_id = 'aab5aafd-f108-4ac9-a10e-ec6c112c41bb' where "product category" = 'Electronics';
update public.product set product_category_id = '59b1285e-6d78-4a02-863f-40197237f34f' where "product category" = 'Clothes';
update public.product set product_category_id = 'e6535155-c403-4b89-a52b-ce8c50f4a7f8' where "product category" = 'Footwear';




