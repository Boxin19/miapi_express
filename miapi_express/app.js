var express = require('express'); // IMP
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
/* const cors = require('cors') */

require('dotenv').config();

var indexRouter = require('./routes/index'); // IMP -> Carpeta routes
var usersRouter = require('./routes/users'); // IMP -> Carpeta routes - se puede borrar. Creo que la de arriba también, solo me define una RUTA. 

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter); // IMP RUTAS
app.use('/users', usersRouter); // IMP

module.exports = app;


