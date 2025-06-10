const express = require('express')
const app = express()
const port = 8081
const os = require('os')

app.get('/', (req, res) => {
  res.send(`Hello from **Service 1** (Port ${port})! Host: ${os.hostname()}\n`)
})

app.get('/health', (req, res) => {
  res.status(200).send('OK')
})

app.listen(port, () => {
  console.log(`Service 1 listening on port ${port}`)
})