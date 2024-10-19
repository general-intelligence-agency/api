-- CreateTable
CREATE TABLE "SecretaryOfStateCheck" (
    "id" TEXT NOT NULL,
    "entity_details" JSONB,
    "entity_display" JSONB,
    "name_history" JSONB,
    "filing_history" JSONB,
    "merger_history" JSONB,
    "assumed_name_history" JSONB,
    "entity_id" TEXT,

    CONSTRAINT "SecretaryOfStateCheck_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "SecretaryOfStateCheck" ADD CONSTRAINT "SecretaryOfStateCheck_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;
