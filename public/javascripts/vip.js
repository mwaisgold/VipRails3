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
	$("#Fichat�cnica").show();
	$("#descriptionCont").hide();
	$("#reviewsTab").hide();	
}

function mostrarDescripcion(){
	$("#Fichat�cnica").hide();
	$("#descriptionCont").show();
	$("#reviewsTab").hide();	
}

function mostrarOpiniones(){
	$("#Fichat�cnica").hide();
	$("#descriptionCont").hide();
	$("#reviewsTab").show();	
}