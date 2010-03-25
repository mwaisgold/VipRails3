window.onload = crearGal;

// Crea contenedor de toda la galeria y elementos principales
function crearGal(){
	var wrapThumb = document.createElement('div');
	wrapThumb.className = 'thumb';
	
	var imgPrincipal = document.getElementById('imgPrincipal');
	imgPrincipal.orden = 0;
	imgPrincipal.onclick = function(){
		Modal(imgPrincipal.orden)
	};
	
	crearSlider(wrapThumb);
	
	// Impresion de los tags
	if(arr.length > 5){
		var prev = crearFlecha('prev');
		wrapThumb.appendChild(prev);
		var next = crearFlecha('next');
		wrapThumb.appendChild(next);
	};
};

// Crea el slider
function crearSlider(divConte){
	var div = document.createElement('div');
	div.id = 'carrusel';
	div.izq = 0;
	
	for(i=0; i<arr.length; i++){
		var imgT = document.createElement('img');
		imgT.src = arr[i];
		imgT.id = 'item'+i;
		imgT.orden = i;
		if(i==0){
			imgT.className = 'selected';
		};
		 
		div.appendChild(imgT);
	};
	
	divConte.appendChild(div);
	document.getElementById('galeria').appendChild(divConte);
	
	for(u=0; u<arr.length; u++){
		new clickImagenSmall(document.getElementById('item'+u));
	};
};

// Asignar la funcion onclick a cada imagen chica
function clickImagenSmall(obj){
	obj.onclick = function(){
		document.getElementById('imgPrincipal').src = '#'; // P/loading
		document.getElementById('imgPrincipal').src = this.src.replace("v=M","v=L");
		document.getElementById('imgPrincipal').orden = obj.orden;
		unselectImgs();
		obj.className = 'selected'; // Marcar como seleccionada la imagen
	};
};

// Deseleccionar imagenes chicas
function unselectImgs(){
	for(i=0; i<arr.length; i++){
		document.getElementById('item'+i).className = '';
	};
};

function crearFlecha(direccion){
	var flecha = document.createElement('span');
	flecha.id = direccion;
	flecha.className = direccion;
	flecha.disponible = true;
	
	flecha.onclick = function(){
		if(document.getElementById(direccion).disponible == false){ // Evita cliquear mientras se desplaza
			return; // Sale del onclick
		};
		
		document.getElementById(direccion).disponible = false; // Se desactiva el cliqueo
		
		var div = document.getElementById('carrusel');
		var posInicial = div.izq;
		var efecto = setInterval(moverSlider, 1);
		var velocidad = 5; // Multiplos de 5
		
		// Movimiento del slider
		function moverSlider(){
			switch(direccion){
				case 'prev': // Hacia la izquierda
					div.izq += velocidad;
					div.style.left = div.izq + 'px';
					if(div.izq == 0){
						resetSlider(direccion);
					};
				break;
				case 'next': // Hacia la derecha
					div.izq -= velocidad;
					div.style.left = div.izq + 'px';
					if((-1*div.izq) == 250){
						resetSlider(direccion);
					};
				break;
			};
		};
		
		// Reseteo de slider
		function resetSlider(){
			switch(direccion){
				case 'prev': // Hacia la izquierda
					var a = 'none';
					var b = 'block';
				break;
				case 'next': // Hacia la derecha
					var a = 'block';
					var b = 'none';
				break;
			};
			
			clearInterval(efecto);
			document.getElementById(direccion).disponible = true; // Se activa el cliqueo
			document.getElementById('prev').style.display = a;
			document.getElementById('next').style.display = b;
		};
	};
	// Fin onclick
	
	if(direccion=='prev'){ // Elimina la flecha izquierda al inicio
		flecha.style.display = 'none';
	};
	return flecha;
};

// Modal

function conocerTecla(elEvento){
	var evento = elEvento || window.event;
	var caracter = evento.charCode || evento.keyCode;
	return caracter;
};


function Modal(mostrar){
	thatModal = this;
	
	// Div negro
	this.Layer = document.createElement('div');
	this.Layer.id = 'Layer';
	this.Layer.onclick = function(){
		thatModal.closeModalclick();
	};

	var PantallaUsuarioH = Number(screen.height);
	this.Layer.style.height = PantallaUsuarioH + 'px';
	
	// Contenedor
	this.Contenedor = document.createElement("div");
	this.Contenedor.id = "Contenedor";
	// Centrado en la pantalla
	if(window.innerHeight){ // Gecko
		this.Contenedor.style.top = (window.innerHeight - 550)/2 + 'px';
		this.Contenedor.style.left = (window.innerWidth - 600)/2 + 'px';
	}else{ // IE
		this.Contenedor.style.top = (document.body.clientHeight -550)/2 + 'px';
		this.Contenedor.style.left = (document.body.clientWidth -600)/2 + 'px';
	};
	
	// Cerrar (link)
	this.closer = document.createElement("span");
	this.closer.id = "closer";
	this.closer.innerHTML = 'Cerrar';
	this.closer.onclick = function(){
		thatModal.closeModalclick();
	};
	
	// Cerrar (esc)
	this.closeModal = function(){
		document.onkeyup = function(elEvento){
			var caract = conocerTecla(elEvento);
			if (caract == 27) {
				thatModal.closeModalclick();
			};
		};
	};
	
	//
	this.closeModalclick = function(){
		thatModal.Contenedor.style.display = "none";
		thatModal.Layer.style.display = "none";
	};
	
	// Imprimir tags en el documento
	document.body.appendChild(this.Layer);
	this.Contenedor.appendChild(this.closer);
	document.body.appendChild(this.Contenedor);
	
	// Crea los thumbs
	this.crearThumbsModal = function(mostrar){
		var div = document.createElement('div');
		div.id = 'thumbsModal';
		
		for(i=0; i<arr.length; i++){
			var imgT = document.createElement('img');
			imgT.src = arr[i];
			imgT.id = 'itemModal'+i;
			imgT.orden = i;
			if(i==mostrar){
				imgT.className = 'selected';
			};
			 
			div.appendChild(imgT);
		};
		
		document.getElementById('Contenedor').appendChild(div);
		
		for(u=0; u<arr.length; u++){
			new clickImagenSmallModal(document.getElementById('itemModal'+u));
		};
	};
	
	// Areas cliqueables
	this.crearAreaCliqueable = function(direccion){
		var div = document.createElement('div');
		div.id = 'clic' + direccion;
		div.className = 'clickModal';
		
		document.getElementById('Contenedor').appendChild(div);
	};
	
	this.cargarContenido = function(mostrar){
		// Imagen Ppal
		var imgPpal = document.createElement('img');
		imgPpal.id = 'imgPpalModal';
		imgPpal.src = arr[mostrar].replace("v=M","v=L");
		this.Contenedor.appendChild(imgPpal);
		
		// Botones
		this.crearAreaCliqueable('izq');
		this.crearAreaCliqueable('der');
		
		// Thumbs
		this.crearThumbsModal(mostrar);
	};
	this.cargarContenido(mostrar);
	
	// Asignar la funcion onclick a cada imagen chica
	function clickImagenSmallModal(obj){
		obj.onclick = function(){
			document.getElementById('imgPpalModal').src = '#'; // P/loading
			document.getElementById('imgPpalModal').src = this.src.replace("v=M","v=L");
			document.getElementById('imgPpalModal').orden = obj.orden;
			unselectImgsModal();
			obj.className = 'selected'; // Marcar como seleccionada la imagen
		};
	};
	
	// Deseleccionar imagenes chicas
	function unselectImgsModal(){
		for(i=0; i<arr.length; i++){
			document.getElementById('itemModal'+i).className = '';
		};
	};
};