-- CreateTable
CREATE TABLE "AdverseMediaResult" (
    "id" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "explanation" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AdverseMediaResult_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AdverseMediaResult" ADD CONSTRAINT "AdverseMediaResult_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
