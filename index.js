import "./assets/pspdfkit.js";
// We need to inform PSPDFKit where to look for its library assets, i.e. the location of the `pspdfkit-lib` directory.
const baseUrl = `${window.location.protocol}//${window.location.host}/assets/`;

var PDFname = "design.pdf";

// so onClick will change the pdfName variable. yay

PSPDFKit.load({
	baseUrl,
	container: "#pspdfkit",
	document: PDFname
})
.then(instance => {
	console.log("PSPDFKit loaded", instance);
})
.catch(error => {
	console.error(error.message);
});
