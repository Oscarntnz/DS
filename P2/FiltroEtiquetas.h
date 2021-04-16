#ifndef FILTROETIQUETAS_H
#define FILTROETIQUETAS_H

#include <string>
#include "Filtro.h"
#include "Post.h"

class FiltroEtiquetas : public Filtro {
    public:
        std::string ejecutar(Post &post);
};

#endif
