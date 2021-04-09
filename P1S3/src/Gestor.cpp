#include "Gestor.h"

Usuario * Gestor::registrar(const std::string & nombreUsuario, const std::string & password) {
	if(!nombreUsuario.empty() && nombreUsuario.size() > 3 && !password.empty() && password.size() > 3){
		usuarios.push_back(new Usuario(nombreUsuario, password));

		return usuarios.back();
	}
	else
		return nullptr;
}

void Gestor::setAdminFiltros(AdminFiltros * adminFiltros) {
	this->adminFiltros = adminFiltros;
}

Post* Gestor::publicarPost(const std::string & texto, Usuario & autor) {
	Post* resultado = new Post(texto, autor);

	adminFiltros->setTarget(*resultado);
	adminFiltros->ejecutar();

	publicaciones.push_back(resultado);

	return publicaciones.back();
}

std::vector<Post *> Gestor::getPublicaciones(std::string etiqueta)const{
	std::vector<Post *> resultado;

	for(auto it = publicaciones.cbegin(); it != publicaciones.cend(); ++it)
		if((*it)->tieneEtiqueta(etiqueta))
			resultado.push_back(*it);

	return resultado;
}