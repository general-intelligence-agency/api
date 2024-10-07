-- CreateTable
CREATE TABLE "NAICSCodeGeneration" (
    "id" TEXT NOT NULL,
    "naics_code" TEXT NOT NULL,
    "explanation" TEXT NOT NULL,
    "entity_id" TEXT,

    CONSTRAINT "NAICSCodeGeneration_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "NAICSCodeGeneration" ADD CONSTRAINT "NAICSCodeGeneration_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;
