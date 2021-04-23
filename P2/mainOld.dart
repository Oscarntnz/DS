import 'Gestor.dart';
import 'FiltroEtiquetas.dart';
import 'FiltroCensura.dart';
import 'AdminFiltros.dart';
import 'Post.dart';
import 'Usuario.dart';
import 'dart:io';

void imprimirPublicaciones(List<Post> publicaciones){
  var it = publicaciones.iterator;

  while(it.moveNext())
    print(it.current.getTexto() + "\n\t- " + it.current.getAutor().getNombre());
}

int main(){
  Gestor gestor = new Gestor();
  AdminFiltros adminFiltros = new AdminFiltros();
  FiltroEtiquetas fEtiq = new FiltroEtiquetas();
  FiltroCensura fCen = new FiltroCensura();

  adminFiltros.setFiltro(fEtiq);
  adminFiltros.setFiltro(fCen);

  gestor.setAdminFiltros(adminFiltros);

  Usuario u1 = gestor.registrar("mistyroasted", "1234");
  Usuario u2 = gestor.registrar("viewbeach", "4321");
  Usuario u3 = gestor.registrar("cartierfalter", "13245");

  gestor.publicarPost("esta es la palla que he hecho hoy #paella", u1);
  gestor.publicarPost("hoy he hecho unas croquetas para comer #croquetas #delicia", u2);
  gestor.publicarPost("hello world yo tambien quiero croquetas #croquetas", u3);

  String opcion = "\0";

  while(opcion != "q"){
    print("Bienvenido:");
    print("1.- registrarse:");
    print("q.- salir:");
    opcion = stdin.readLineSync();

    if(opcion == '1'){
      bool valido = false;
      String nom, pass;
      Usuario user;
  
      while(!valido){
        print("Nombre de usuario:");
        nom = stdin.readLineSync();
        print("Contraseña:");
        pass = stdin.readLineSync();
    
        user = gestor.registrar(nom, pass);
    
        if(user == null){
          print("Datos no validos, prueba de nuevo");
        }
        else{
          print("Registro correcto");
          valido = true;
        }
      }
  
      opcion = "\0";
      while(opcion != 'q'){
        print("1.- publicar:");
        print("2.- buscar:");
        print("q.- salir:");
        opcion = stdin.readLineSync();
        print("");

        if(opcion == '1'){
          String texto;

          print("Introduce el texto:");
          texto = stdin.readLineSync();

          Post publ = gestor.publicarPost(texto, user);

          print(publ.getTexto());
        }
        else if(opcion == '2'){
          List<Post> publicaciones;
          String etiqueta;

          print("Introduce la etiqueta a buscar:");
          etiqueta = stdin.readLineSync();

          publicaciones = gestor.getPublicaciones(etiqueta);

          if(publicaciones != null)  imprimirPublicaciones(publicaciones);
          else  print("No hay publicaciones con esa etiqueta");
        }
      }

    }
    else if(opcion != 'q'){
      print("Opcion no valida");
    }
  }

  return 0;
}