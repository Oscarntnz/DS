#ifndef CADENAFILTROS_H
#define CADENAFILTROS_H

#include "Filtro.h"
#include "Post.h"
#include <vector>

class CadenaFiltros {
private:
        std::vector<Filtro *> filtros;
        Post* target;

public:

        CadenaFiltros();
        CadenaFiltros(Post &target);
        void addFiltro(Filtro &filtro);
        void setTarget(Post &objetivo);
        void ejecutar();
};

#endif
