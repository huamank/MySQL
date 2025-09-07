ALTER TABLE products
ADD CONSTRAINT chk_price_positive CHECK (list_price > 0);