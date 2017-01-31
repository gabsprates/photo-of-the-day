# :camera::earth_africa::blowfish: Photo of the Day :sunrise_over_mountains::date:

** Made to [Gnome](https://www.gnome.org/) interface, but I accept pull requests :smile:

This is a initial idea to save the National Geographic's Photo Of The Day. I love this photos, then I can set them as my desktop background image, what I did before manually.


## How to use

### `index.js` file

This file make the request to the NatGeo server and returns the image url. Initially, the var `req` is the URL from the photo page, but if you need to set any other thing to make requests with NodeJS, you can change it to an object, like this:

```js
// original
const req = "http://www.nationalgeographic.com/photography/photo-of-the-day/";

// with any configuration
const req = {
  host: "your proxy ip, for exemple",
  port: "your proxy port, for exemple",
  path: "http://www.nationalgeographic.com/photography/photo-of-the-day/"
}
```

### `getDesktopBG.sh` file

This file get the return of `index.js`, download the image on `./images/` dir and set her as your background image.

---

Well, this is it. Those is just the first steps. Already is something.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT © [Gabriel Prates](http://gabrielprates.com)
