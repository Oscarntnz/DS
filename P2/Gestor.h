#ifndef GESTOR_H
#define GESTOR_H

#include "AdminFiltros.h"
#include <vector>
#include "Usuario.h"
#include "Post.h"

class Gestor {
	private:
		AdminFiltros *adminFiltros;
		std::vector<Usuario *> usuarios;
		std::vector<Post *> publicaciones;

	public:
		Usuario * registrar(const std::string & nombreUsuario, const std::string & password);
		void setAdminFiltros(AdminFiltros * adminFiltros);
		Post* publicarPost(const std::string & texto, Usuario & autor);

		inline std::vector<Usuario *> getUsuarios()const{
			return usuarios;
		}

		inline std::vector<Post *> getPublicaciones()const{
			return publicaciones;
		}
                
		std::vector<Post *> getPublicaciones(std::string etiqueta)const;
};

#endif
