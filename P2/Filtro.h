#ifndef FILTRO_H
#define FILTRO_H

#include<string>
#include "Post.h"

class Filtro {
    public:
        virtual std::string ejecutar(Post &post) = 0;
};

#endif
