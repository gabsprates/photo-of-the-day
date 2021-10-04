# :camera::earth_africa::blowfish: Photo of the Day :sunrise_over_mountains::date:


** Made to [Gnome](https://www.gnome.org/) interface, but I accept pull requests :smile:

This is a initial idea to save the National Geographic's Photo Of The Day. I love these photos, then I can set them as my desktop background image, what I did before manually.

NatGeo Photo of the Day: https://www.nationalgeographic.com/photo-of-the-day/

## How to use

### `getDesktopBG.sh` file

This file:
- makes the request to the NatGeo server and returns the image url;
- downloads the found image to `./images/` dir;
- changes the Gnome background to be the downloaded NetGeo's image of the day.


After clone it, run:

```sh
$ cd ./photo-of-the-day
$ ./getDesktopBG.sh
```

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
