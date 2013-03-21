-- Column: codice_fiscale

-- ALTER TABLE member DROP COLUMN codice_fiscale;
BEGIN;

ALTER TABLE member ADD COLUMN codice_fiscale character varying(16);
COMMENT ON COLUMN member.codice_fiscale IS 'Italian tax identification number (Codice fiscale)';

COMMIT;
