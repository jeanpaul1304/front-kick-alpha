var 
	express = require('express'),
	bodyParser = require('body-parser'),
	app = express();

app.use(express.static('../../public'));

app.listen(3000);

console.log("escuchando servidor");