-- CreateEnum
CREATE TYPE "Lookup" AS ENUM ('ADVERSE_MEDIA', 'SECRETARY_OF_STATE', 'GOVERNMENT_LOAN_DATA', 'SMALL_BUSINESS_ADMINSTRATION_DATABASE', 'YELP', 'LINKED_IN', 'FACEBOOK', 'INSTAGRAM', 'TIKTOK', 'GOOGLE_MAPS_PLACE', 'GOOGLE_MAPS_DETAILS');

-- AlterTable
ALTER TABLE "LLMConfiguration" ADD COLUMN     "expected_business" TEXT,
ADD COLUMN     "expected_geographical_area" TEXT,
ADD COLUMN     "high_risk_industries" TEXT[],
ADD COLUMN     "lookups" "Lookup"[],
ADD COLUMN     "use_historical_approvals" BOOLEAN;
