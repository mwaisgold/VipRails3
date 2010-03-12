var maxSize;
var preImg;

function setMaxWidth(){
	preImg = new Image();
	
	preImg.onload = preLoadMaxSize;
	preImg.src = srcMainImg;
}

function preLoadMaxSize(){
	maxSize = preImg.width;
	document.getElementById("mainImg").width = maxSize;
}

function moveToTope(){window.scroll(0,0);}

function mostrarPreguntas(){
	$("#Preguntasalvendedor").show();
	$("#Calificacionesdecompradores").hide();
}

function mostrarCalif(){
	$("#Preguntasalvendedor").hide();
	$("#Calificacionesdecompradores").show();
}

function mostrarFicha(){
	$("#Fichatecnica").show();
	$("#descriptionCont").hide();
	$("#reviewsTab").hide();	
}

function mostrarDescripcion(){
	$("#Fichatecnica").hide();
	$("#descriptionCont").show();
	$("#reviewsTab").hide();	
}

function mostrarOpiniones(){
	$("#Fichatecnica").hide();
	$("#descriptionCont").hide();
	$("#reviewsTab").show();	
}