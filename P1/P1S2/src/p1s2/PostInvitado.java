package p1s2;

import java.lang.Cloneable;
import java.util.ArrayList;

public class PostInvitado extends Post implements Cloneable {

    public PostInvitado(String texto, Invitado autor){
        super(texto, autor);
    }

    @Override
    public Object clone(){
        PostInvitado clon = new PostInvitado(new String(this.texto), (Invitado)this.autor);
        
        clon.respuestas = new ArrayList<Post>(this.respuestas);
        
        return clon;
    }

}