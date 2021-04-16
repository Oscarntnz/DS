#ifndef POST_H
#define POST_H

#include<vector>
#include<string>
#include "Usuario.h"

class Post {
	private:
		std::string texto;
		Usuario* autor;
		std::vector<std::string> etiquetas;

	public:
		Post(const std::string & texto, Usuario &autor);

		std::string getTexto()const{
			return texto;
		}

		void setTexto(std::string texto){
			this->texto = texto;
		}

		std::vector<std::string> getEtiquietas()const{
			return etiquetas;
		}
                
                Usuario * getAutor()const{
                    return autor;
                }

		bool tieneEtiqueta(std::string etiqueta)const;

		void setEtiquetas(std::vector<std::string> etiquetas){
			this->etiquetas.clear();

			for(auto it = etiquetas.cbegin(); it < etiquetas.cend(); ++it)
				this->etiquetas.push_back(*it);
		}
};

#endif
