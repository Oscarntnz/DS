#ifndef USUARIO_H
#define USUARIO_H

#include <string>

class Usuario {
	private:
		std::string nombreUsuario;
		std::string password;
	public:
		Usuario(const std::string & nombreUsuario, const std::string & password);

		std::string getNombre(){
			return nombreUsuario;
		}
};

#endif
