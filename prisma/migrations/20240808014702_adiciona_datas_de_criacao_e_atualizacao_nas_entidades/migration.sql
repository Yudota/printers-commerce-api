/*
  Warnings:

  - You are about to drop the column `updatedAt` on the `Pedidos` table. All the data in the column will be lost.
  - Added the required column `modifiedAt` to the `Avaliacoes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Cartoes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Categorias` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Estoques` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `GruposPrecificacoes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `ImagemProdutos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `MetodosPagamentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `PedidoItens` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Pedidos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Produtos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `ProdutosVariacoes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Telefones` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modifiedAt` to the `Usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Avaliacoes" ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Cartoes" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Categorias" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Estoques" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "GruposPrecificacoes" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "ImagemProdutos" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "MetodosPagamentos" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "PedidoItens" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Pedidos" DROP COLUMN "updatedAt",
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Produtos" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "ProdutosVariacoes" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Telefones" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Usuarios" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "modifiedAt" TIMESTAMP(3) NOT NULL;
