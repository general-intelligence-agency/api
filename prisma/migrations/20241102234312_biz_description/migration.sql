-- CreateTable
CREATE TABLE "BusinessDescription" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "sources" TEXT[],
    "entity_id" TEXT NOT NULL,

    CONSTRAINT "BusinessDescription_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "BusinessDescription" ADD CONSTRAINT "BusinessDescription_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
