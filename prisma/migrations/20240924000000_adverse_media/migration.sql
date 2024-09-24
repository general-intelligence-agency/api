-- CreateTable
CREATE TABLE IF NOT EXISTS "AdverseMediaResult" (
    "id" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "explanation" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AdverseMediaResult_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_name = 'AdverseMediaResult_entity_id_fkey'
    ) THEN
        ALTER TABLE "AdverseMediaResult" ADD CONSTRAINT "AdverseMediaResult_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
    END IF;
END $$;
