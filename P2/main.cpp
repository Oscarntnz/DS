#include <iostream>
#include "Gestor.h"
#include "FiltroEtiquetas.h"
#include "FiltroCensura.h"
#include "Post.h"
#include "Usuario.h"
#include <vector>
#include <string>

using namespace std;

void imprimirPublicaciones(const std::vector<Post *> & publicaciones){
    for(auto it = publicaciones.cbegin(); it != publicaciones.cend(); ++it)
        cout << (*it)->getTexto() << endl << "\t- " << (*it)->getAutor()->getNombre() << endl;
}

int main(){
    Gestor gestor;
    AdminFiltros adminFiltros;
    FiltroEtiquetas fEtiq;
    FiltroCensura fCen;

    adminFiltros.setFiltro(fEtiq);
    adminFiltros.setFiltro(fCen);
    
    gestor.setAdminFiltros(&adminFiltros);

    Usuario * u1 = gestor.registrar("mistyroasted", "1234");
    Usuario * u2 = gestor.registrar("viewbeach", "4321");
    Usuario * u3 = gestor.registrar("cartierfalter", "13245");

    gestor.publicarPost("esta es la palla que he hecho hoy #paella", *u1);
    gestor.publicarPost("hoy he hecho unas croquetas para comer #croquetas #delicia", *u2);
    gestor.publicarPost("hello world yo tambien quiero croquetas #croquetas", *u3);

    char opcion = '\0';

    while(opcion != 'q'){
        cout << "Bienvenido:" << endl;
        cout << "1.- registrarse:" << endl;
        cout << "q.- salir:" << endl;
        cin >> opcion;
        
        if(opcion == '1'){
            bool valido = false;
            std::string nom, pass;
            Usuario * user = nullptr;

            while(!valido){
                cout << "Nombre de usuario:" << endl;
                cin >> nom;
                cout << "Contraseña:" << endl;
                cin >> pass;

                user = gestor.registrar(nom, pass);

                if(user == nullptr){
                    cout << "Datos no validos, prueba de nuevo" << endl;
                }
                else{
                    cout << "Registro correcto" << endl;
                    valido = true;
                }
            }

            opcion = '\0';
            while(opcion != 'q'){
                cout << "1.- publicar:" << endl;
                cout << "2.- buscar:" << endl;
                cout << "q.- salir:" << endl;
                cin >> opcion;
                cout << endl;

                if(opcion == '1'){
                    std::string texto;

                    cout << "Introduce el texto:" << endl;
                    cin.ignore();
                    getline(cin, texto);

                    Post* publ = gestor.publicarPost(texto, *user);

                    cout << publ->getTexto() << endl;
                }
                else if(opcion == '2'){
                    std::vector<Post *> publicaciones;
                    std::string etiqueta;

                    cout << "Introduce la etiqueta a buscar:" << endl;
                    cin >> etiqueta;

                    publicaciones = gestor.getPublicaciones(etiqueta);

                    imprimirPublicaciones(publicaciones);
                }
            }

        }
        else if(opcion != 'q'){
            cout << "Opcion no valida" << endl;
        }
    }

    return 0;
}