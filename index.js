import "./assets/pspdfkit.js";

  
var PDFname = "design.pdf";
var PDFarrayCounter = 0;
const PDFs = ["design.pdf", "requirements.pdf", "projects.pdf"];


// so onClick will change the pdfName variable. 
export function increasePDF(){
	console.log("reached desired function");
	if (PDFarrayCounter < 2){
		PDFarrayCounter = PDFarrayCounter + 1;
		PDFname = PDFs[PDFarrayCounter];

		PSPDFKit.unload(instance)

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
	}


}

export function decreasePDF(){
	if (PDFarrayCounter > 0){
		PDFarrayCounter = PDFarrayCounter -1;
		PDFname = PDFs[PDFarrayCounter];

		PSPDFKit.unload(instance)

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
	}

}


// We need to inform PSPDFKit where to look for its library assets, i.e. the location of the `pspdfkit-lib` directory.
const baseUrl = `${window.location.protocol}//${window.location.host}/assets/`;


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
