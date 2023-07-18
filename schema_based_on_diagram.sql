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

CREATE TABLE invoices (
  id int GENERATED ALWAYS AS IDENTITY,
  total_amount numeric(10,2),
  generated_at timestamp(6),
  payed_at timestamp(6),
  medical_history_id int,
  PRIMARY KEY (id)
);
CREATE INDEX invoices_medical_history_id_idx ON invoices(medical_history_id);