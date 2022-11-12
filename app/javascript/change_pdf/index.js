
import "./assets/pspdfkit.js";


var PDFname = "pdf/design.pdf";
var PDFarrayCounter = 0;
const PDFs = ["pdf/design.pdf", "pdf/requirements.pdf", "pdf/projects.pdf"];


// We need to inform PSPDFKit where to look for its library assets, i.e. the location of the `pspdfkit-lib` directory.
const baseUrl = `${window.location.protocol}//${window.location.host}/assets/change_pdf/assets/`;


 //get a reference to the element
var nextButton = document.getElementById('nextButton');
var previousButton = document.getElementById('previousButton');


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
.then(instance => nextButton.onclick = function increasePDF(){
	console.log("reached desired function");
	if (PDFarrayCounter < 2){
		PDFarrayCounter = PDFarrayCounter + 1;
		PDFname = PDFs[PDFarrayCounter];
		PSPDFKit.unload("#pspdfkit");

		recursive();
	}
})
.then(instance => previousButton.onclick = function decreasePDF(){
	console.log("reached desired function");
	if (PDFarrayCounter > 0){
		PDFarrayCounter = PDFarrayCounter -1;
		PDFname = PDFs[PDFarrayCounter];
		PSPDFKit.unload("#pspdfkit");

		recursive();
	}
})
.catch(error => {
	console.error(error.message);
});
}

recursive();

#f=Dir.children("./change_pdf/");

console.log(File.directory?(file_name));