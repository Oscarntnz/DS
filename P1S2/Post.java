package P1S2;

import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class Post extends Thread{

	protected String texto;
        protected Usuario autor;
        protected ArrayList<Post> respuestas;
        protected Tipo tipoPost;
        
        public Post(String texto, Usuario autor){
            this.texto = texto;
            this.autor = autor;
            this.respuestas = new ArrayList<Post>();
        }
        
        public Usuario getAutor(){
            return this.autor;
        }
        
        public Tipo getTipo(){
            return this.tipoPost;
        }
        
        public String getTexto(){
            return this.texto;
        }
        
        @Override
        public void run(){
            Post respuesta = null;
            while(respuestas.size() < 5){
                try {
                    respuesta = null;
                    Thread.sleep(ThreadLocalRandom.current().nextLong(1000));
                    Gestor.getInstance().crearPost(null, null, tipoPost);
                    
                    if(respuesta != null){
                        respuestas.add(respuesta);
                        System.out.println(respuesta.autor.getNombre() + " responde a " +
                                this.autor.getNombre() + ": " + this.texto);
                    }
                } catch (InterruptedException ex) {
                    Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
}