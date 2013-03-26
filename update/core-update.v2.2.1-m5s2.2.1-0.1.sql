-- Column: codice_fiscale

-- ALTER TABLE member DROP COLUMN codice_fiscale;
BEGIN;

ALTER TABLE member ADD COLUMN codice_fiscale character varying(16);
COMMENT ON COLUMN member.codice_fiscale IS 'Italian tax identification number (Codice fiscale)';
-- Function: codice_fiscale_insert_trigger()

-- DROP FUNCTION codice_fiscale_insert_trigger();

CREATE FUNCTION codice_fiscale_insert_trigger()
  RETURNS TRIGGER
  LANGUAGE plpgsql VOLATILE AS $$
    DECLARE myrec int;
    BEGIN
       IF length (NEW.codice_fiscale) = 16 OR NEW.codice_fiscale ISNULL THEN
                RETURN NEW;
        ELSE
                RAISE EXCEPTION 'Lunghezza non permessa';
      END IF;
      RETURN NULL;
   END;
  $$;

-- Trigger: codice_fiscale_validation on member

-- DROP TRIGGER codice_fiscale_validation ON member;

CREATE TRIGGER codice_fiscale_validation
  BEFORE INSERT OR UPDATE
  ON member
  FOR EACH ROW
  EXECUTE PROCEDURE codice_fiscale_insert_trigger();


COMMIT;
