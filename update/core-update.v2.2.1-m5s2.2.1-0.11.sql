ALTER TABLE member ADD COLUMN nin TEXT UNIQUE;
UPDATE member SET nin=codice_fiscale::TEXT;
COMMENT ON COLUMN member.nin IS 'National Insurance Number';

DROP TRIGGER codice_fiscale_validation ON member;
DROP FUNCTION codice_fiscale_insert_trigger();

CREATE FUNCTION nin_insert_trigger()
  RETURNS TRIGGER
  LANGUAGE plpgsql VOLATILE AS $$
    DECLARE myrec int;
    BEGIN
       IF length (NEW.nin) = 16 OR NEW.nin ISNULL THEN
                RETURN NEW;
        ELSE
                RAISE EXCEPTION 'Wrong lenght';
      END IF;
      RETURN NULL;
   END;
  $$;
CREATE TRIGGER nin_validation
  BEFORE INSERT OR UPDATE ON "member"
  FOR EACH ROW EXECUTE PROCEDURE nin_insert_trigger();

ALTER TABLE member DROP COLUMN codice_fiscale CASCADE;
