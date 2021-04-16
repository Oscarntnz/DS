#include "Post.h"

Post::Post(const std::string & texto, Usuario &autor){
    this->texto = texto;
    this->autor = &autor;
}

bool Post::tieneEtiqueta(std::string etiqueta)const{
    for(auto it = etiquetas.cbegin(); it != etiquetas.cend(); ++it)
        if(*it == etiqueta)
            return true;

    return false;
}