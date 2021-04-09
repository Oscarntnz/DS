#include "AdminFiltros.h"

AdminFiltros::AdminFiltros(): cadenaFiltros(){}

void AdminFiltros::setFiltro(Filtro &filtro) {
	cadenaFiltros.addFiltro(filtro);
}

void AdminFiltros::setTarget(Post &post) {
	cadenaFiltros.setTarget(post);
}

void AdminFiltros::ejecutar() {
	cadenaFiltros.ejecutar();
}
