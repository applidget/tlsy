
net = require 'net'
url = require 'url'
util = require "util"
tls = require "tls"

remoteServerUrl = process.env.REMOTE_SERVER_URL || 'tls://192.168.0.122:1338'
uri = url.parse remoteServerUrl

server = net.createServer (conn) ->
  util.log "incoming TCP"

  options =
    rejectUnauthorized: false

  outgoingSocket = tls.connect uri.port, uri.hostname, options, () ->

  outgoingSocket.setEncoding 'utf8'
  conn.pipe(outgoingSocket)
  outgoingSocket.pipe(conn)

port = process.env.PORT || 1354
server.listen port, () ->
  console.log "server listening on #{port}"