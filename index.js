'use strict';

const http = require('https');
const req  = "https://www.nationalgeographic.com/photography/photo-of-the-day/";

http.get(req, (res) => {

  res.setEncoding('utf8')
  res.on('error', console.error)

  let content = '';
  res.on('data', (chuck) => content += chuck)

  res.on('end', () => {
    try {
      let result = content.match(/meta property="og:image" content="(.*)"/);
      result = result[0].match(/content="(.*)"/);
      console.log(result[1]);
    } catch (e) {
      console.log(e.message);
      process.exit(1);
    }
  })

}).on('error', console.error)
