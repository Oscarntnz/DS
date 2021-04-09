package p1s2;

import java.lang.Cloneable;
import java.util.ArrayList;

public class PostRegistrado extends Post implements Cloneable {
    
    public PostRegistrado(String texto, Registrado autor){
        super(texto, autor);
    }

    @Override
    public Object clone(){
        PostRegistrado clon = new PostRegistrado(new String(this.texto), (Registrado)this.autor);
        
        clon.respuestas = new ArrayList<Post>(this.respuestas);
        
        return clon;
    }
}