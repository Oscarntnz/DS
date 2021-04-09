#ifndef FILTROCENSURA_H
#define FILTROCENSURA_H

#include "Post.h"
#include "Filtro.h"
#include <string>

class FiltroCensura : public Filtro {
	private:
		static const unsigned int N_PAL_PROH;
		static const std::string PALABRAS_PROHIBIDAS[];
		void reemplazar(std::string &resultado, unsigned indice, std::string palabra);

	public:
		std::string ejecutar(Post &post);
};

#endif
