-- CreateTable
CREATE TABLE "HighRiskIndustryResult" (
    "id" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "explanation" TEXT,
    "matchedKeywords" TEXT[],
    "evidenceUrl" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "HighRiskIndustryResult_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "HighRiskIndustryResult_entity_id_category_key" ON "HighRiskIndustryResult"("entity_id", "category");

-- AddForeignKey
ALTER TABLE "HighRiskIndustryResult" ADD CONSTRAINT "HighRiskIndustryResult_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
