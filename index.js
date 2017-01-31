'use strict';

const http = require('http');
const natgeo = "http://www.nationalgeographic.com/photography/photo-of-the-day/";
const options = require('./options');

// this could not be another
options.path = natgeo;

http.get(options, (res) => {

  res.setEncoding('utf8')
  res.on('error', console.error)

  let content = '';
  res.on('data', (chuck) => content += chuck)
  res.on('end', () => {

    let result = content.match(/meta property="og:image" content="(.*)"/);
    if (!result) {
      console.log('nada');
      return;
    }

    result = result[0].match(/content="(.*)"/);

    console.log(result[1]);

  })

}).on('error', console.error)
