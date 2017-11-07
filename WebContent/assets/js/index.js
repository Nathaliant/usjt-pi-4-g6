var geocoder;
var map;
var marker;
var markers = [];

$(document).ready(function() {

	if ($('.main-panel > .content').length == 0) {
		$('.main-panel').css('height', '100%');
	}

	iniciarMapa();

});


function consoleInfo(id) {
	$("#cadastroEndereco").val(markers[id].place_obj.formatted_address);
	var place = markers[id].place_obj;
	var endereco = place.formatted_address;
	var nome = place.name;
	var latitude = place.geometry.location.lat();
	var longitude = place.geometry.location.lng();

	$("#txtLatitude").val(latitude);
	$("#txtLongitude").val(longitude);
	$("#cadastroEndereco").val(endereco);
	$("#cadastroNome").val(nome);

	$(".cadastrarEstabelecimento-modal").modal("show")
}

function criaInfoWindow(marker, content) {
	var infowindow = new google.maps.InfoWindow({
		content : content
	});

	marker.addListener('click', function() {
		infowindow.open(marker.get('map'), marker);

	});

}

function iniciarMapa() {
	var latlng = new google.maps.LatLng(-18.8800397, -47.05878999999999);
	var options = {
		disableDefaultUI : false,
		zoom : 5,
		center : latlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(document.getElementById("map"), options);

	// Adiciona input ao mapa.
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	// Baixa os resultados do input para o viewport do mapa
	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});
	// var markers = [];
	// Aciona evento de mais informacoes para cara resultado do input
	searchBox.addListener('places_changed', function() {
		var places = searchBox.getPlaces();
		if (places.length == 0) {
			return;
		}

		// Apaga marcadores antigos
		markers.forEach(function(marker) {
			marker.setMap(null);
		});
		// Reseta array de markers
		markers = [];

		// ///////////////////////////////////////////////////
		// Aciona chamada apropriada de acordo com
		// o total disparado pela busca do input:
		// um resultado com marcador arrastavel ou
		// varios resultados com marcadores clicaveis

		var bounds = new google.maps.LatLngBounds();
		var infowindow = new google.maps.InfoWindow();
		if (places.length == 1) {
			places.forEach(function(place) {
				console.log(place);
				if (!place.geometry) {
					console.log("Local sem dados de posição.");
					return;
				}
				var icone = {
					url : place.icon,
					size : new google.maps.Size(71, 71),
					origin : new google.maps.Point(0, 0),
					anchor : new google.maps.Point(17, 34),
					scaledSize : new google.maps.Size(25, 25)
				};

				// Cria marcador para cada resultado.
				var marker = new google.maps.Marker({
					map : map,
					icon : icone,
					title : place.name,
					position : place.geometry.location,
					clickable : true,
					place_obj : place
				});

				// Retorna dados da posicao ao soltar o
				// pin
				geocoder = new google.maps.Geocoder();
				google.maps.event.addListener(marker, 'drag', function() {
					geocoder.geocode({
						'latLng' : marker.getPosition()
					}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							if (results[0]) {
								console.log(results[0]);
							}
						}
					});
				});

				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}

				markers.push(marker);

			});
			map.fitBounds(bounds);

		} else {
			places.forEach(function(place) {
				if (!place.geometry) {
					console.log("Local sem dados de posição.");
					return;
				}
				var icone = {
					url : place.icon,
					size : new google.maps.Size(71, 71),
					origin : new google.maps.Point(0, 0),
					anchor : new google.maps.Point(17, 34),
					scaledSize : new google.maps.Size(25, 25)
				};

				var marker = new google.maps.Marker({
					map : map,
					icon : icone,
					title : place.name,
					position : place.geometry.location,
					place_obj : place
				});

				var marker_id = ((markers.push(marker)) - 1);

				var content = "<strong>" + place.name + "</strong><br>" + "<p>"
						+ place.formatted_address + "</p>"
						+ "<a href='javascript:void(0)' onclick='consoleInfo("
						+ marker_id + ")' class='infoview-cadastrar' ref="
						+ marker_id + ">Cadastrar este local</a>";

				criaInfoWindow(marker, content);

				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}

			});
			map.fitBounds(bounds);
		}
		// /////////////////////////////////////////////////////

	});

}
