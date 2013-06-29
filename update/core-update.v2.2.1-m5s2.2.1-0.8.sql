-- Column: member_id

-- ALTER TABLE issue DROP COLUMN member_id;

ALTER TABLE issue ADD COLUMN member_id integer;
COMMENT ON COLUMN issue.member_id IS 'Author ID';
