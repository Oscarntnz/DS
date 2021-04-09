#include "CadenaFiltros.h"

CadenaFiltros::CadenaFiltros(){
	this->target = nullptr;
}

CadenaFiltros::CadenaFiltros(Post &target){
	this->target = &target;
}

void CadenaFiltros::addFiltro(Filtro &filtro) {
	filtros.push_back(&filtro);
}

void CadenaFiltros::setTarget(Post &objetivo){
    target = &objetivo;
}

void CadenaFiltros::ejecutar() {
    for(int i= 0; i < filtros.size(); i++)
            filtros[i]->ejecutar(*target);       
}
