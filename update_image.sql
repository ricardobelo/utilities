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
