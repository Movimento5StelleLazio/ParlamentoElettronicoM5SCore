-- Column: m5sid

-- ALTER TABLE member DROP COLUMN m5sid;

ALTER TABLE member ADD COLUMN m5sid integer;
COMMENT ON COLUMN member.m5sid IS 'M5S identification number';

-- Column: rsa_public_key

-- ALTER TABLE member DROP COLUMN rsa_public_key;

ALTER TABLE member ADD COLUMN rsa_public_key bytea;
COMMENT ON COLUMN member.rsa_public_key IS 'RSA Public Key for member';

-- Column: certification_level

-- ALTER TABLE member DROP COLUMN certification_level;

ALTER TABLE member ADD COLUMN certification_level integer;
ALTER TABLE member ALTER COLUMN certification_level SET DEFAULT 0;
COMMENT ON COLUMN member.certification_level IS '0 = non certificato, 1 = certificato, 2 = pec, 3 = token';

-- Column: token_serial

-- ALTER TABLE member DROP COLUMN token_serial;

ALTER TABLE member ADD COLUMN token_serial text;
COMMENT ON COLUMN member.token_serial IS 'Token serial';



