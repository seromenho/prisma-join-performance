import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

describe('Find around 20k rows with data from other tables', () => {
  it('findMany', async() => {
    await prisma.a.findMany({
      where: {
        name: '40k records',
      },
      select: {
        B: true,
        C: true,
        D: true,
        E: true,
        F: true,
        G: true
      }
    })
  })

  it('findMany and take only some', async() => {
    await prisma.a.findMany({
      where: {
        name: '40k records',
      },
      select: {
        B: true,
        C: true,
        D: true,
        E: true,
        F: true,
        G: true
      },
      take: 10000
    })
  })

  it('Raw query with LEFT JOIN (relatively fast ~1s)', async () => {
    await prisma.$queryRawUnsafe(`
      SELECT
        "A".id,
        "B".id as bid,
        "C".id as cid,
        "D".id as did,
        "E".id as eid,
        "F".id as fid,
        "G".id as gid
      FROM
        "A"
        LEFT JOIN "B" ON "A".id = "B".id
        LEFT JOIN "C" ON "A".id = "C".id
        LEFT JOIN "D" ON "A".id = "D".id
        LEFT JOIN "E" ON "A".id = "E".id
        LEFT JOIN "F" ON "A".id = "F".id
        LEFT JOIN "G" ON "A".id = "G".id
      WHERE
        name = '40k records'
    `)
  })
})
