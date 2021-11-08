const jsonServer = require('json-server');
const server = jsonServer.create();
const router = jsonServer.router(process.env.DB || 'db.json');
const middlewares = jsonServer.defaults();

server.use(middlewares);
const appid = process.env.APPID;

server.get("/appid", (req,res) => 
res.send(`appid: ${appid} home page: says hello!`))

// Add custom routes before JSON Server router
server.get('/echo', (req, res) => {
    res.jsonp(req.query)
  })
  
  // To handle POST, PUT and PATCH you need to use a body-parser
  // You can use the one used by JSON Server
//   server.use(jsonServer.bodyParser)
//   server.use((req, res, next) => {
//     if (req.method === 'POST') {
//       req.body.createdAt = Date.now()
//     }
//     // Continue to JSON Server router
//     next()
//   })

server.use(router);

module.exports = server;
