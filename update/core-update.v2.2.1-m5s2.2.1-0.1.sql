BEGIN;
-- Column: elected

-- ALTER TABLE member DROP COLUMN elected;

ALTER TABLE member ADD COLUMN elected boolean;
COMMENT ON COLUMN member.elected IS 'Member was selected by vote for an office';


COMMIT;
