/*
  Warnings:

  - You are about to drop the `GoogleMapsLookup` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GoogleMapsPlace` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GoogleMapsLookup" DROP CONSTRAINT "GoogleMapsLookup_entity_id_fkey";

-- DropForeignKey
ALTER TABLE "GoogleMapsLookup" DROP CONSTRAINT "GoogleMapsLookup_place_id_fkey";

-- DropTable
DROP TABLE "GoogleMapsLookup";

-- DropTable
DROP TABLE "GoogleMapsPlace";

-- CreateTable
CREATE TABLE "GoogleMapsPlaceLookup" (
    "id" TEXT NOT NULL,
    "place_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "formatted_address" TEXT,
    "business_status" TEXT,
    "icon_url" TEXT,
    "icon_background_color" TEXT,
    "icon_mask_base_uri" TEXT,
    "price_level" INTEGER,
    "rating" DOUBLE PRECISION,
    "user_ratings_total" INTEGER,
    "geometry" JSONB,
    "opening_hours" JSONB,
    "photos" JSONB,
    "plus_code" JSONB,
    "types" TEXT[],
    "last_updated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "entity_id" TEXT,

    CONSTRAINT "GoogleMapsPlaceLookup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GoogleMapsDetailsLookup" (
    "id" TEXT NOT NULL,
    "place_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "formatted_address" TEXT,
    "formatted_phone_number" TEXT,
    "website" TEXT,
    "rating" DOUBLE PRECISION,
    "user_ratings_total" INTEGER,
    "opening_hours" JSONB,
    "last_updated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "entity_id" TEXT,

    CONSTRAINT "GoogleMapsDetailsLookup_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsPlaceLookup_place_id_key" ON "GoogleMapsPlaceLookup"("place_id");

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsPlaceLookup_entity_id_key" ON "GoogleMapsPlaceLookup"("entity_id");

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsDetailsLookup_place_id_key" ON "GoogleMapsDetailsLookup"("place_id");

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsDetailsLookup_entity_id_key" ON "GoogleMapsDetailsLookup"("entity_id");

-- AddForeignKey
ALTER TABLE "GoogleMapsPlaceLookup" ADD CONSTRAINT "GoogleMapsPlaceLookup_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GoogleMapsDetailsLookup" ADD CONSTRAINT "GoogleMapsDetailsLookup_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;
