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

CREATE TABLE med_treat_helper_table (
  id int GENERATED ALWAYS AS IDENTITY,
  treatment_id int,
  med_history_id int,
  PRIMARY KEY (id)
);
CREATE INDEX helper_table_med_history_id_idx ON med_treat_helper_table(treatment_id);
CREATE INDEX helper_table_treatment_id_idx ON med_treat_helper_table(med_history_id);

CREATE TABLE medical_histories (
  id int GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp(6),
  patient_id int,
  status varchar(50), 
  PRIMARY KEY (id)
);

CREATE INDEX medical_histories_patient_id_idx ON medical_histories(patient_id);

CREATE TABLE patients (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  date_of_birth date,
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id int GENERATED ALWAYS AS IDENTITY,
  type varchar(60),
  name varchar(100),
  PRIMARY KEY (id)
);

ALTER TABLE invoice_items ADD CONSTRAINT invoice_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES invoices (id);
ALTER TABLE invoice_items ADD CONSTRAINT invoice_items_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES treatments (id);
ALTER TABLE invoices ADD CONSTRAINT invoices_medical_history_id_fkey FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id);
ALTER TABLE med_treat_helper_table ADD CONSTRAINT helper_table_med_history_id_fkey FOREIGN KEY (med_history_id) REFERENCES medical_histories (id);
ALTER TABLE med_treat_helper_table ADD CONSTRAINT helper_table_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES treatments (id);
ALTER TABLE medical_histories ADD CONSTRAINT medical_histories_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES patients (id);
