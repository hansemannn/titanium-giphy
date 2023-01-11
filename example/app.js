import Giphy from 'ti.giphy';

const window = Ti.UI.createWindow({ title: 'Giphy Demo'});
const btn = Ti.UI.createButton({ title: 'Select GIF!', bottom: 30 });
const img = Ti.UI.createImageView();
const lbl = Ti.UI.createLabel({ top: 0 });

btn.addEventListener('click', () => {
	Giphy.initialize({ apiKey: 'YOUR_GIPHY_API_KEY' });

	Giphy.showGIFDialog({
		callback: async event => {
			// Process further using the "event.url" property!
			img.image = event.url;
			lbl.text = `Title: ${event.title}\nURL: ${event.url}`;
		}
	});
});

window.add([img, lbl, btn]);
window.open();
