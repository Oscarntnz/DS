#include "FiltroEtiquetas.h"
#include <vector>
#include <string>

std::string FiltroEtiquetas::ejecutar(Post &post) {
	
	std::string etiqueta;
	std::vector<std::string> etiquetas;
	std::string texto = post.getTexto();
	int i = 0;

	while(i < texto.size()){
		if(texto[i] == '#'){
                    i++;
			while(texto[i] != ' ' && i < texto.size()){
				etiqueta += texto[i];
				i++;
			}

			if(!etiqueta.empty()){
				etiquetas.push_back(etiqueta);
				etiqueta.clear();
			}
		}
		else
			i++;
	}

	post.setEtiquetas(etiquetas);
        
        return texto;
}
