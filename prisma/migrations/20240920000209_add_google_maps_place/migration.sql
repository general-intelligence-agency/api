-- CreateTable
CREATE TABLE "GoogleMapsPlace" (
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

    CONSTRAINT "GoogleMapsPlace_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsPlace_place_id_key" ON "GoogleMapsPlace"("place_id");

-- AddForeignKey
ALTER TABLE "GoogleMapsLookup" ADD CONSTRAINT "GoogleMapsLookup_place_id_fkey" FOREIGN KEY ("place_id") REFERENCES "GoogleMapsPlace"("place_id") ON DELETE RESTRICT ON UPDATE CASCADE;
