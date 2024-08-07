-- CreateEnum
CREATE TYPE "OrderStatus" AS ENUM ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED');

-- CreateTable
CREATE TABLE "Categorias" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Categorias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Produtos" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "baseCost" DOUBLE PRECISION NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "pricingGroupId" INTEGER NOT NULL,

    CONSTRAINT "Produtos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProdutosVariacoes" (
    "id" SERIAL NOT NULL,
    "productId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION,
    "stock" INTEGER NOT NULL,

    CONSTRAINT "ProdutosVariacoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estoques" (
    "id" SERIAL NOT NULL,
    "productId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Estoques_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Avaliacoes" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Avaliacoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImagemProdutos" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "ImagemProdutos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GruposPrecificacoes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "profitMargin" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "GruposPrecificacoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pedidos" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "status" "OrderStatus" NOT NULL DEFAULT 'PENDING',
    "total" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "shippingAddressId" INTEGER NOT NULL,
    "paymentMethodId" INTEGER NOT NULL,
    "notes" TEXT,

    CONSTRAINT "Pedidos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PedidoItens" (
    "id" SERIAL NOT NULL,
    "orderId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "variationId" INTEGER,
    "quantity" INTEGER NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "totalPrice" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "PedidoItens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MetodosPagamentos" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "details" TEXT NOT NULL,

    CONSTRAINT "MetodosPagamentos_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categorias"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_pricingGroupId_fkey" FOREIGN KEY ("pricingGroupId") REFERENCES "GruposPrecificacoes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProdutosVariacoes" ADD CONSTRAINT "ProdutosVariacoes_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estoques" ADD CONSTRAINT "Estoques_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacoes" ADD CONSTRAINT "Avaliacoes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacoes" ADD CONSTRAINT "Avaliacoes_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagemProdutos" ADD CONSTRAINT "ImagemProdutos_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedidos" ADD CONSTRAINT "Pedidos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedidos" ADD CONSTRAINT "Pedidos_shippingAddressId_fkey" FOREIGN KEY ("shippingAddressId") REFERENCES "Enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedidos" ADD CONSTRAINT "Pedidos_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES "MetodosPagamentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PedidoItens" ADD CONSTRAINT "PedidoItens_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Pedidos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PedidoItens" ADD CONSTRAINT "PedidoItens_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PedidoItens" ADD CONSTRAINT "PedidoItens_variationId_fkey" FOREIGN KEY ("variationId") REFERENCES "ProdutosVariacoes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
