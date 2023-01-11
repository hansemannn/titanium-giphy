import Giphy from 'ti.giphy';

const window = Ti.UI.createWindow({ title: 'Giphy Demo'});
const btn = Ti.UI.createButton({ title: 'Select GIF!' });

btn.addEventListener('click', () => {
	Giphy.initialize({ apiKey: 'YOUR_GIPHY_API_KEY' });

	Giphy.showGIFDialog({
		callback: async event => {
			// Process further using the "event.url" property!
		}
	});
});

window.add(btn);
window.open();