#SELECT *  FROM `lc_product` WHERE `date_available` = '2022-12-12';
#SELECT *  FROM `lc_product` WHERE product_id = 3021;
#UPDATE lc_product SET image = CONCAT("catalog/tecidos/zibeline/", lc_product.sku, ".jpg") WHERE date_available = '2022-12-12' and model = 'zibeline';
#list
#SELECT * FROM lc_product_description WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-04-17' and model = 'cortina');
#Replace
#UPDATE lc_product_description 
#SET name = replace(name, 'Flamê', 'Flame'),
#description = replace(description, 'Flamê', 'Flame'),
#tag = replace(tag, 'Flamê', 'Flame'),
#meta_title = replace(meta_title, 'Flamê', 'Flame'), 
#meta_description = replace(meta_description, 'Flamê', 'Flame'), 
#meta_keyword = replace(meta_keyword, 'Flamê', 'Flame')
#WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-04-17' and model = 'cortina');

#########
#replace(meta_keyword, 'Flamê', 'Flame') 
#CONCAT("prefix", lc_product_description.name, "sufix"),
#SELECT * FROM lc_product_description WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-07-21' and model = 'crepe_beethoven');
#SELECT * FROM lc_product_description WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-07-21' and model = 'crepe_beethoven' and sku = codigo);

#UPDATE lc_product_description SET
#name = CONCAT("", lc_product_description.name, "Preto"),
#description = replace(meta_keyword, 'Crepe Beethoven', 'Crepe Beethoven Preto'),
#tag = CONCAT("", lc_product_description.tag, "Preto"),
#meta_title = CONCAT("", lc_product_description.meta_title, "Preto"),
#meta_description = CONCAT("", lc_product_description.meta_description, "Preto"),
#meta_keyword = CONCAT("", lc_product_description.meta_keyword, "Preto"),
#WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-07-21' and model = 'crepe_beethoven' and sku = 13976);

#ADJUST CATEGORIES SUBCATEGORIES
INSERT INTO lc_product_to_category (product_id, category_id)
SELECT product_id, 99999 FROM lc_product WHERE date_available = '2023-07-27' and model = 'crepe_alfaiataria';

#ADJUST CATEGORIES SUBCATEGORIES IF NOT EXIST
INSERT INTO lc_product_to_category (product_id, category_id) 
SELECT product_id, 99999 FROM lc_product WHERE model IN ('category_01', 'category_02') AND NOT EXISTS ( SELECT 1 FROM lc_product_to_category ptc WHERE ptc.product_id = lc_product.product_id AND ptc.category_id = 99999 );

#DELETE
DELETE FROM lc_product_to_category
WHERE product_id IN (SELECT product_id FROM lc_product WHERE model LIKE '%zibeline%') AND category_id = 525;

