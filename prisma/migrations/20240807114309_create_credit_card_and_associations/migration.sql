-- AlterTable
ALTER TABLE "Usuarios" ADD COLUMN     "ranking" INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "Cartoes" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "cardNumber" TEXT NOT NULL,
    "cardHolderName" TEXT NOT NULL,
    "cardBrand" TEXT NOT NULL,
    "securityCode" TEXT NOT NULL,

    CONSTRAINT "Cartoes_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Cartoes" ADD CONSTRAINT "Cartoes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
