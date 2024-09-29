/*
  Warnings:

  - You are about to drop the column `high_risk_industries` on the `LLMConfiguration` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[high_risk_indutries_id]` on the table `LLMConfiguration` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "LLMConfiguration" DROP COLUMN "high_risk_industries",
ADD COLUMN     "high_risk_indutries_id" TEXT;

-- CreateTable
CREATE TABLE "HighRiskIndustriesSettings" (
    "id" TEXT NOT NULL,
    "adultEntertainmentOrServices" BOOLEAN NOT NULL DEFAULT true,
    "cannabis" BOOLEAN NOT NULL DEFAULT true,
    "checkCashingMoneyServiceBusiness" BOOLEAN NOT NULL DEFAULT true,
    "counterfeitOrUnauthorizedGoods" BOOLEAN NOT NULL DEFAULT true,
    "crowdfundingVentureCapitalCompany" BOOLEAN NOT NULL DEFAULT true,
    "cryptoATM" BOOLEAN NOT NULL DEFAULT true,
    "debtCollections" BOOLEAN NOT NULL DEFAULT true,
    "debtReductions" BOOLEAN NOT NULL DEFAULT true,
    "drugsAndDrugParaphernalia" BOOLEAN NOT NULL DEFAULT true,
    "embassyConsulateNonprofitNGO" BOOLEAN NOT NULL DEFAULT true,
    "estateAgentRealEstateBroker" BOOLEAN NOT NULL DEFAULT true,
    "travelAgency" BOOLEAN NOT NULL DEFAULT true,
    "usedCarSales" BOOLEAN NOT NULL DEFAULT true,
    "telemarketer" BOOLEAN NOT NULL DEFAULT true,
    "firearmsAmmunitionsArmsExplosivesNuclear" BOOLEAN NOT NULL DEFAULT true,
    "gamblingJunketOperator" BOOLEAN NOT NULL DEFAULT true,
    "gamingGameOfSkill" BOOLEAN NOT NULL DEFAULT true,
    "preciousMetalsDealerJewelGem" BOOLEAN NOT NULL DEFAULT true,
    "prepaidOrGiftCards" BOOLEAN NOT NULL DEFAULT true,
    "ransomwareRecoveryServices" BOOLEAN NOT NULL DEFAULT true,
    "shellBankInvestmentManagementMoneyManagement" BOOLEAN NOT NULL DEFAULT true,
    "tobaccoVapeSupplies" BOOLEAN NOT NULL DEFAULT true,
    "toxicFlammableRadioactiveMaterials" BOOLEAN NOT NULL DEFAULT true,
    "unregulatedPharmaceuticalsSales" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "HighRiskIndustriesSettings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "HighRiskIndustriesSettings_id_key" ON "HighRiskIndustriesSettings"("id");

-- CreateIndex
CREATE UNIQUE INDEX "LLMConfiguration_high_risk_indutries_id_key" ON "LLMConfiguration"("high_risk_indutries_id");

-- AddForeignKey
ALTER TABLE "LLMConfiguration" ADD CONSTRAINT "LLMConfiguration_high_risk_indutries_id_fkey" FOREIGN KEY ("high_risk_indutries_id") REFERENCES "HighRiskIndustriesSettings"("id") ON DELETE SET NULL ON UPDATE CASCADE;
