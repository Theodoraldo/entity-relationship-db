CREATE TABLE invoice_items (
  id int GENERATED ALWAYS AS IDENTITY,
  unit_price numeric(10,2),
  quantity int,
  total_price numeric(10,2),
  invoice_id int,
  treatment_id int,
  PRIMARY KEY (id)
);

CREATE INDEX invoice_items_invoice_id_idx ON invoice_items(invoice_id);
CREATE INDEX invoice_items_treatment_id_idx ON invoice_items(treatment_id);