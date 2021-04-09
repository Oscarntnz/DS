#ifndef ADMINFILTROS_H
#define ADMINFILTROS_H

#include "Filtro.h"
#include "Post.h"
#include "CadenaFiltros.h"
#include "Filtro.h"

class AdminFiltros {
    private:
        CadenaFiltros cadenaFiltros;

    public:
        AdminFiltros();
        void setFiltro(Filtro &filtro);
        void setTarget(Post &post);
        void ejecutar();
};

#endif
