#include "FiltroCensura.h"

const unsigned int FiltroCensura::N_PAL_PROH = 3;
const std::string FiltroCensura::PALABRAS_PROHIBIDAS[] = {"hello", "world", "filtro"};

std::string FiltroCensura::ejecutar(Post &post) {
	int indice = -1;
	std::string resultado = post.getTexto();

	for(int i = 0; i < N_PAL_PROH; i++){ // cambio de palabra
		do{ // mientras exista esa palabra prohibida, sigue buscando
			indice = resultado.find(PALABRAS_PROHIBIDAS[i]);

			if(indice != -1){
				reemplazar(resultado, indice, PALABRAS_PROHIBIDAS[i]);
			}

		}while(indice != -1);
	}
        
        post.setTexto(resultado);
        
        return resultado;
}

void FiltroCensura::reemplazar(std::string & texto, unsigned indice, std::string palabra){
	for(int i = 0; i < palabra.size(); i++)
		texto[indice + i] = '*';
}