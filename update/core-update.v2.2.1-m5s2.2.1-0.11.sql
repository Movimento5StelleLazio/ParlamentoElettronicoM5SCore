BEGIN;
ALTER TABLE member ADD COLUMN unit_group_id INT4;
COMMENT ON COLUMN "member"."unit_group_id"       IS 'ID of city of location of residence';
ALTER TABLE member ADD COLUMN lastname TEXT;
COMMENT ON COLUMN "member"."lastname"              IS 'Real last name of the member, may be NULL if account has not been activated yet';
ALTER TABLE member ADD COLUMN firstname TEXT;
COMMENT ON COLUMN "member"."firstname"              IS 'Real first name of the member, may be NULL if account has not been activated yet';
ALTER TABLE member ADD COLUMN creator_id INT4;
COMMENT ON COLUMN "member"."creator_id"           IS 'Auditor member who created this account';
ALTER TABLE member ADD COLUMN certifier_id INT4;
COMMENT ON COLUMN "member"."certifier_id"         IS 'Auditor member who certified this account';
ALTER TABLE member ADD COLUMN certified TIMESTAMPTZ;
COMMENT ON COLUMN "member"."certified"              IS 'Timestamp of certification of account';
ALTER TABLE member ADD COLUMN auditor BOOLEAN;
COMMENT ON COLUMN "member"."auditor"              IS 'Member is an auditor who can create, modify or certify other members';
ALTER TABLE member ADD COLUMN lqfb_access BOOLEAN;
COMMENT ON COLUMN "member"."lqfb_access"          IS 'Member has access to lqfb. If FALSE member can still use admin and auditor functions';


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
                RAISE EXCEPTION 'Wrong NIN lenght';
      END IF;
      RETURN NULL;
   END;
  $$;
CREATE TRIGGER nin_validation
  BEFORE INSERT OR UPDATE ON "member"
  FOR EACH ROW EXECUTE PROCEDURE nin_insert_trigger();

ALTER TABLE member DROP COLUMN codice_fiscale CASCADE;
ALTER TABLE member DROP COLUMN m5sid CASCADE;

COMMIT;
