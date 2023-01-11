# Giphy in Titanium

<img src="./.github/giphy-sdk.gif" height="300" />

Use the native Giphy iOS- and Android SDK's to select GIFs and display them in your app.

## Requirements

- [x] Titanium SDK 11.0.0+

## APIs

- `initialize({ apiKey })`: Initialize the SDK and provide your API key
- `showGIFDialog({ callback })`: Select a GIF and return it to the provided callback

## Example

See the example/app.js for details!

## Note

The default Android ImageView won't show the GIF animation. Check e.g. [av.imageview](https://github.com/AndreaVitale/av.imageview) for GIF support.

## Author

Hans Knöchel

## License

MIT
