-- CreateTable
CREATE TABLE "Entity" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "website" TEXT,
    "zipcode" TEXT,
    "custom_fields" JSONB,
    "owner_first_name" TEXT NOT NULL,
    "owner_last_name" TEXT NOT NULL,
    "ownership_percentage" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Entity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Application" (
    "id" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,

    CONSTRAINT "Application_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LinkedInLookup" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "linkedin_internal_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "website" TEXT,
    "industry" TEXT,
    "company_size_min" INTEGER,
    "company_size_max" INTEGER,
    "company_size_linkedin" INTEGER,
    "company_type" TEXT,
    "founded_year" INTEGER,
    "specialities" TEXT[],
    "tagline" TEXT,
    "universal_name_id" TEXT,
    "follower_count" INTEGER,
    "last_updated" TIMESTAMP(3) NOT NULL,
    "entity_id" TEXT,
    "hq" JSONB,
    "locations" JSONB,
    "profile_pic_url" TEXT,
    "background_cover_image_url" TEXT,

    CONSTRAINT "LinkedInLookup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "YelpLookup" (
    "id" TEXT NOT NULL,
    "yelp_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "image_url" TEXT,
    "is_closed" BOOLEAN NOT NULL,
    "url" TEXT NOT NULL,
    "review_count" INTEGER NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "price" TEXT,
    "phone" TEXT,
    "display_phone" TEXT,
    "distance" DOUBLE PRECISION,
    "categories" JSONB,
    "transactions" JSONB,
    "location" JSONB,
    "business_hours" JSONB,
    "attributes" JSONB,
    "last_updated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "entity_id" TEXT,

    CONSTRAINT "YelpLookup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GoogleMapsLookup" (
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

    CONSTRAINT "GoogleMapsLookup_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "LinkedInLookup_entity_id_key" ON "LinkedInLookup"("entity_id");

-- CreateIndex
CREATE UNIQUE INDEX "YelpLookup_yelp_id_key" ON "YelpLookup"("yelp_id");

-- CreateIndex
CREATE UNIQUE INDEX "YelpLookup_entity_id_key" ON "YelpLookup"("entity_id");

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsLookup_place_id_key" ON "GoogleMapsLookup"("place_id");

-- CreateIndex
CREATE UNIQUE INDEX "GoogleMapsLookup_entity_id_key" ON "GoogleMapsLookup"("entity_id");

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LinkedInLookup" ADD CONSTRAINT "LinkedInLookup_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "YelpLookup" ADD CONSTRAINT "YelpLookup_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GoogleMapsLookup" ADD CONSTRAINT "GoogleMapsLookup_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;
