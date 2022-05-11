import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  prisma.$queryRawUnsafe(`
  INSERT INTO "A" (
      name
  )
  SELECT
      md5(random()::text)
  FROM generate_series(1, 500000) s(i)
  `)
  await prisma.$queryRawUnsafe(`
  INSERT INTO "A" (
      name
  )
  SELECT
      '40k records'
  FROM generate_series(1, 40000) s(i)
  `)
  Promise.all(['B', 'C', 'D', 'E', 'F', 'G'].map(model => prisma.$queryRawUnsafe(`
  INSERT INTO "${model}" (
      "aId"
  )
  SELECT
      id
  FROM "A"
  `)))
}

main()
  .catch((e) => {
    console.log(e)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })