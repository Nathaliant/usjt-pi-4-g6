var geocoder;
var map;
var marker;
var markers_google = [];
var markers_est = [];

$(document).ready(function() {

	if ($('.main-panel > .content').length == 0) {
		$('.main-panel').css('height', '100%');
	}

	iniciarMapa();

	$("#btnBuscarEstabelecimento").click(function(e) {
		e.preventDefault();
		var form = $("#formBuscaEst");
		data = getFormData(form);
		console.log(data);
		$.ajax({
			url : "controller.do",
			data : data,
			method : "POST",
			success : function(data) {
				$("#tabelaEstabelecimentos").html(data);
			}
		})

	});

});

// function toggleModal(idModalAtual, idModalDestino) {
//	
// var idModalDispose = "#" + idModalAtual; // faço isso para formatar o seletor
// do jquery (tudo o que se pega por id precisa do # assim como no css.
// var idModalOpen = "#" + idModalDestino;
//
// $(idModalDispose).modal('hide');
//
// $(idModalDispose).on('hidden.bs.modal', function() {
// $(idModalOpen).modal('show');
// });
//	
// }

function consoleInfo(id) {
	$("#cadastroEndereco").val(markers_google[id].place_obj.formatted_address);
	var place = markers_google[id].place_obj;
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

function limpaInfoWindow(marker, content) {

	google.maps.event.clearInstanceListeners(infoWindow);
	infoWindow.close();
	infoWindow = null;
}

function carregaMarkersEstabelecimentos(estabelecimentos) {

	for ( var i in estabelecimentos) {
		var icon_url = "assets/img/marker_icon.png";
		var icone = {
			url : icon_url,
			size : new google.maps.Size(71, 71),
			origin : new google.maps.Point(0, 0),
			anchor : new google.maps.Point(17, 34),
			scaledSize : new google.maps.Size(50, 50)
		};
		var marker = new google.maps.Marker({
			map : map,
			icon : icone,
			title : estabelecimentos[i].nome,
			position : {
				lat : parseFloat(estabelecimentos[i].lat),
				lng : parseFloat(estabelecimentos[i].lng)
			},
			clickable : true,
			draggable : false,
			estabelecimento_obj : estabelecimentos[i]
		});
		
		markers_est.push(marker);
	}

}

function buscaMarkersEstabelecimentos() {

	var output = [];

	$.ajax({
		url : "controller.do",
		data : {
			"command" : "CarregarMarkersEstabelecimento"
		},
		method : "POST",
		success : function(data) {
			data = $.parseJSON(data);
			for ( var d in data) {
				var obj = $.parseJSON(data[d]);
				output.push(obj);
			}
			carregaMarkersEstabelecimentos(output);
		}
	})
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
	

	// Adiciona markers dos estabelecimentos cadastrados
	buscaMarkersEstabelecimentos();
	
	// Adiciona input ao mapa.
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	// Baixa os resultados do input para o viewport do mapa
	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});
	
	// Aciona evento de mais informacoes para cada resultado do input
	searchBox
			.addListener(
					'places_changed',
					function() {
						var places = searchBox.getPlaces();
						if (places.length == 0) {
							return;
						}

						// Apaga marcadores antigos
						markers_google.forEach(function(marker) {
							marker.setMap(null);
						});
						// Reseta array de markers_google
						markers_google = [];

						// ///////////////////////////////////////////////////
						// Aciona chamada apropriada de acordo com
						// o total disparado pela busca do input:
						// um resultado com marcador arrastavel ou
						// varios resultados com marcadores clicaveis

						var bounds = new google.maps.LatLngBounds();
						var infowindow = new google.maps.InfoWindow();
						if (places.length == 1) {
							places
									.forEach(function(place) {
										console.log(place);
										if (!place.geometry) {
											console
													.log("Local sem dados de posição.");
											return;
										}
										var icone = {
											url : place.icon,
											size : new google.maps.Size(71, 71),
											origin : new google.maps.Point(0, 0),
											anchor : new google.maps.Point(17,
													34),
											scaledSize : new google.maps.Size(
													25, 25)
										};

										// Cria marcador para cada resultado.
										var marker = new google.maps.Marker({
											map : map,
											icon : icone,
											title : place.name,
											position : place.geometry.location,
											clickable : true,
											draggable : true,
											place_obj : place
										});

										var marker_id = ((markers_google
												.push(marker)) - 1);

										var content = "<strong>"
												+ place.name
												+ "</strong><br>"
												+ "<p>"
												+ place.formatted_address
												+ "</p>"
												+ "<a href='javascript:void(0)' onclick='consoleInfo("
												+ marker_id
												+ ")' class='infoview-cadastrar' ref="
												+ marker_id
												+ ">Cadastrar este local</a>";

										criaInfoWindow(marker, content);

										// Retorna dados da posicao ao soltar o
										// pin
										geocoder = new google.maps.Geocoder();
										google.maps.event
												.addListener(
														marker,
														'drag',
														function() {
															geocoder
																	.geocode(
																			{
																				'latLng' : marker
																						.getPosition()
																			},
																			function(
																					results,
																					status) {
																				if (status == google.maps.GeocoderStatus.OK) {
																					if (results[0]) {
																						console
																								.log(results[0]);
																						var content = "<strong>"
																								+ place.name
																								+ "</strong><br>"
																								+ "<p>"
																								+ place.formatted_address
																								+ "</p>"
																								+ "<a href='javascript:void(0)' onclick='consoleInfo("
																								+ marker_id
																								+ ")' class='infoview-cadastrar' ref="
																								+ marker_id
																								+ ">Cadastrar este local</a>";

																						criaInfoWindow(
																								marker,
																								content);
																					}
																				}
																			});
														});

										if (place.geometry.viewport) {
											// Only geocodes have viewport.
											bounds
													.union(place.geometry.viewport);
										} else {
											bounds
													.extend(place.geometry.location);
										}

										markers_google.push(marker);

									});
							map.fitBounds(bounds);

						} else {
							places
									.forEach(function(place) {
										if (!place.geometry) {
											console
													.log("Local sem dados de posição.");
											return;
										}
										var icone = {
											url : place.icon,
											size : new google.maps.Size(71, 71),
											origin : new google.maps.Point(0, 0),
											anchor : new google.maps.Point(17,
													34),
											scaledSize : new google.maps.Size(
													25, 25)
										};

										var marker = new google.maps.Marker({
											map : map,
											icon : icone,
											title : place.name,
											position : place.geometry.location,
											place_obj : place
										});

										var marker_id = ((markers_google
												.push(marker)) - 1);

										var content = "<strong>"
												+ place.name
												+ "</strong><br>"
												+ "<p>"
												+ place.formatted_address
												+ "</p>"
												+ "<a href='javascript:void(0)' onclick='consoleInfo("
												+ marker_id
												+ ")' class='infoview-cadastrar' ref="
												+ marker_id
												+ ">Cadastrar este local</a>";

										criaInfoWindow(marker, content);

										if (place.geometry.viewport) {
											// Only geocodes have viewport.
											bounds
													.union(place.geometry.viewport);
										} else {
											bounds
													.extend(place.geometry.location);
										}

									});
							map.fitBounds(bounds);
						}
						// /////////////////////////////////////////////////////

					});

}
