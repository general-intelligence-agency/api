-- CreateTable
CREATE TABLE "RequirementsList" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "requirements" JSONB NOT NULL,
    "organization_id" TEXT NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RequirementsList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FilledRequirementsList" (
    "id" TEXT NOT NULL,
    "requirements_list_id" TEXT NOT NULL,
    "application_id" TEXT NOT NULL,
    "values" JSONB NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FilledRequirementsList_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "RequirementsList" ADD CONSTRAINT "RequirementsList_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilledRequirementsList" ADD CONSTRAINT "FilledRequirementsList_requirements_list_id_fkey" FOREIGN KEY ("requirements_list_id") REFERENCES "RequirementsList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilledRequirementsList" ADD CONSTRAINT "FilledRequirementsList_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "Application"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
