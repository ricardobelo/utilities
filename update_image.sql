
# update image and date added
UPDATE lc_product SET date_added = '2024-06-14',  image = CONCAT("catalog/tecidos/crepe_beethoven/", lc_product.sku, ".jpg") WHERE date_available = '2024-06-14' and model = 'crepe_beethoven';

# update by sku
UPDATE lc_product SET STATUS = 0 WHERE sku IN (11825,11826,11830,11835,11839,11840,11842,11843,11845,11846,13936,14456,14459,14460);

#SELECT *  FROM `lc_product` WHERE `date_available` = '2022-12-12';
#SELECT *  FROM `lc_product` WHERE product_id = 3021;
#UPDATE lc_product SET image = CONCAT("catalog/tecidos/zibeline/", lc_product.sku, ".jpg") WHERE date_available = '2022-12-12' and model = 'zibeline';
#list
#SELECT * FROM lc_product_description WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-04-17' and model = 'cortina');

#--------------------------------------------------
#SELECT p.product_id as ID, model as MODELO, sku, name as NOME, price as PREÇO, date_added as DATa, date_modified as MODIFICADO_EM FROM lc_product p LEFT JOIN lc_product_description pd ON (p.product_id = pd.product_id) where STATUS = 1;
#itens_disponiveis_em_lojascrispim_data
#--------------------------------------------------

  #Replace
#UPDATE lc_product_description 
#SET name = replace(name, 'Flamê', 'Flame'),
#description = replace(description, 'Flamê', 'Flame'),
#tag = replace(tag, 'Flamê', 'Flame'),
#meta_title = replace(meta_title, 'Flamê', 'Flame'), 
#meta_description = replace(meta_description, 'Flamê', 'Flame'), 
#meta_keyword = replace(meta_keyword, 'Flamê', 'Flame')
#WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-04-17' and model = 'category_01');

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
#WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2023-07-21' and model = 'category_01' and sku = 13976);




UPDATE lc_product_description
SET

  name = replace(lc_product_description.name, 'Cetim Bucol', 'Cetim Bucol Princese'),
  description = replace(lc_product_description.description, 'Cetim Bucol', 'Cetim Bucol Princese'),
  meta_title = replace(lc_product_description.meta_description, 'Cetim Bucol', 'Cetim Bucol Princese'),
  meta_description = replace(lc_product_description.meta_description, 'Cetim Bucol', 'Cetim Bucol Princese'),
  
  meta_keyword = REPLACE(
    REPLACE(
      REPLACE(meta_keyword, 'Cetim Bucol ', 'Cetim Bucol Princese '),
      'Cetim Bucol,', 'Cetim Bucol Princese,'
    ),
    'Cetim, Bucol,', 'Cetim, Bucol, Princese,'
  ),
  
  tag = REPLACE(
    REPLACE(
      REPLACE(tag, 'Cetim Bucol ', 'Cetim Bucol Princese '),
      'Cetim Bucol,', 'Cetim Bucol Princese,'
    ),
    'Cetim, Bucol,', 'Cetim, Bucol, Princese,'
  )
  
WHERE
  product_id IN (
    SELECT product_id
    FROM lc_product
    WHERE date_available = '2023-12-20' AND model = 'cetim_bucol' AND sku != 14952
  );









UPDATE lc_product_description SET description = replace(description, 'Zibeline ', '<br/>Zibeline ') WHERE product_id IN (SELECT product_id FROM lc_product WHERE date_available = '2024-06-13' and model = 'zibeline');




#ADJUST CATEGORIES SUBCATEGORIES
INSERT INTO lc_product_to_category (product_id, category_id)
SELECT product_id, 99999 FROM lc_product WHERE date_available = '2023-07-27' and model = 'category_01';

#ADJUST CATEGORIES SUBCATEGORIES IF NOT EXIST
INSERT INTO lc_product_to_category (product_id, category_id) 
SELECT product_id, 99999 FROM lc_product WHERE model IN ('category_01', 'category_02') AND NOT EXISTS ( SELECT 1 FROM lc_product_to_category ptc WHERE ptc.product_id = lc_product.product_id AND ptc.category_id = 99999 );

#SELECT
SELECT lc_product.*, lc_product_to_category.*
FROM lc_product
JOIN lc_product_to_category ON lc_product_to_category.product_id = lc_product.product_id
WHERE lc_product.model IN ('category_01', 'category_02') AND lc_product_to_category.category_id = 99999;

#DELETE
DELETE FROM lc_product_to_category
WHERE product_id IN (SELECT product_id FROM lc_product WHERE model LIKE '%category_01%') AND category_id = 525;




UPDATE lc_product_attribute SET text = '98% Poliéster
8% Elastano' WHERE product_id  IN (3951,3950,3947,3964,3961,3962,3960,3953,3952,3945,3958,3972,3944,3977,3969,3957,3967,3975,3974,3968,3954,3956,3965,3963,3955,3948,3970,3943,3971,3946,3949,3976,3973,3959,3966,3978,3979);



