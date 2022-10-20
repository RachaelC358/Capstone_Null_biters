import "./assets/pspdfkit.js";
import './showImport.js';

var PDFname = "design.pdf";
var PDFarrayCounter = 0;
const PDFs = ["design.pdf", "requirements.pdf", "projects.pdf"];

/*
// so onClick will change the pdfName variable. 
window.onclick = function increasePDF(){
	//debugger;
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
//var instance = null;
//window.onclick = PSPDFKit.unload(instance);
*/
function decreasePDF(){
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


 //get a reference to the element
 var myBtn = document.getElementById('ham');

var plsLoad = 0;

function recursive(){
	console.log("recursive is called");
PSPDFKit.load({
	baseUrl,
	container: "#pspdfkit",
	document: PDFname
})
.then(instance => {
	console.log("PSPDFKit loaded", instance);
})
.then(instance => myBtn.onclick = function increasePDF(){
	//debugger;
	console.log("reached desired function");
	if (PDFarrayCounter < 2){
		PDFarrayCounter = PDFarrayCounter + 1;
		PDFname = PDFs[PDFarrayCounter];}
		
		PSPDFKit.unload("#pspdfkit");
		
		recursive();
})
.catch(error => {
	console.error(error.message);
}); 
}

recursive();