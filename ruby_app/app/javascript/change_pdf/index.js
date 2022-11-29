import "./assets/pspdfkit.js";

var PDFarrayCounter = 0;
//var PDFarrayTotal = fetch('http://0.0.0.0:3000/api/v1/pdfs');
const response = await fetch('http://0.0.0.0:3000/api/v1/pdfs');
const myJson = await response.json(); //extract JSON from the http response
var PDFarrayTotal = myJson.length - 1;
const PDFs = myJson;


// We need to inform PSPDFKit where to look for its library assets, i.e. the location of the `pspdfkit-lib` directory.
const baseUrl = `${window.location.protocol}//${window.location.host}/assets/change_pdf/assets/`;


 //get a reference to the element
var nextButton = document.getElementById('nextButton');
var previousButton = document.getElementById('previousButton');


function recursive(){
	console.log("recursive is called");
})
.then(instance => {
	console.log("PSPDFKit loaded", instance);
})
.then(instance => nextButton.onclick = function increasePDF(){
	console.log("reached desired function");
	if (PDFarrayCounter < PDFarrayTotal){
		PDFarrayCounter = PDFarrayCounter + 1;
		fetch('http://0.0.0.0:3000/api/v1/pdfs/' + PDFarrayCounter);

		recursive();
	}
})
.then(instance => previousButton.onclick = function decreasePDF(){
	console.log("reached desired function");
	if (PDFarrayCounter > 0){
		PDFarrayCounter = PDFarrayCounter -1;
		fetch('http://0.0.0.0:3000/api/v1/pdfs/' + PDFarrayCounter);

		recursive();
	}
})
.catch(error => {
	console.error(error.message);
});
}

recursive();
