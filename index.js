const { fetchDOM, parse } = require('dopeoplesay-cli')

function output(obj) {
  // eslint-disable-next-line no-console
  console.log(JSON.stringify({ items: obj }, null, 2))
}

async function main(argv, limit = 15) {
  const query = argv[0]

  const dom = await fetchDOM(query)
  const { collocations } = parse(dom, {
    trimLine: true,
    color: false,
  })

  const result = collocations.slice(0, limit).map((c) => ({
    title: c,
    arg: c,
  }))

  output(result)
}

main(process.argv.slice(2))
