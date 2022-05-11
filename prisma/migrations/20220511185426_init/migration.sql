CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateTable
CREATE TABLE "A" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,

    CONSTRAINT "A_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "B" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "aId" UUID NOT NULL,

    CONSTRAINT "B_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "C" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "aId" UUID NOT NULL,

    CONSTRAINT "C_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "D" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "aId" UUID NOT NULL,

    CONSTRAINT "D_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "E" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "aId" UUID NOT NULL,

    CONSTRAINT "E_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "F" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "aId" UUID NOT NULL,

    CONSTRAINT "F_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "G" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "aId" UUID NOT NULL,

    CONSTRAINT "G_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "B" ADD CONSTRAINT "B_aId_fkey" FOREIGN KEY ("aId") REFERENCES "A"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "C" ADD CONSTRAINT "C_aId_fkey" FOREIGN KEY ("aId") REFERENCES "A"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "D" ADD CONSTRAINT "D_aId_fkey" FOREIGN KEY ("aId") REFERENCES "A"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "E" ADD CONSTRAINT "E_aId_fkey" FOREIGN KEY ("aId") REFERENCES "A"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "F" ADD CONSTRAINT "F_aId_fkey" FOREIGN KEY ("aId") REFERENCES "A"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "G" ADD CONSTRAINT "G_aId_fkey" FOREIGN KEY ("aId") REFERENCES "A"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
