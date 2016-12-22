'use strict'

const express = require('express')
const app = express()
const cors = require('cors')

let current = ''
let timeout

app.use(cors())
app.use(require('body-parser').json())

app.post('/', (req, res) => {
  if(timeout) clearTimeout(timeout)
  timeout = setTimeout(() => current = '', req.body.time * 1000)

  current = req.body.name
  res.send('')
})

app.get('*', (req, res) => {
  res.send(current)
})

app.listen(9615)
