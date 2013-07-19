CREATE TABLE keyword (
        "id"                     SERIAL4      PRIMARY KEY,
        "name"                   TEXT         NOT NULL UNIQUE);
COMMENT ON TABLE "keyword" IS 'Possibility to filter issues';

CREATE TABLE issue_keyword (
        "issue_id"               INT4         NOT NULL,
        "keyword_id"             INT4         NOT NULL,
        CONSTRAINT "issue_keyword_pkey" PRIMARY KEY ("issue_id", "keyword_id"),
        CONSTRAINT "issue_keyword_issue_id_fkey" FOREIGN KEY ("issue_id") REFERENCES "issue" ("id") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT "issue_keyword_keyword_id_fkey" FOREIGN KEY ("keyword_id") REFERENCES "keyword" ("id") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE);

COMMENT ON TABLE "issue_keyword" IS 'Keywords to issues association';
