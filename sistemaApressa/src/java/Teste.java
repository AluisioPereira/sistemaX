
import br.edu.ifpb.controle.ControleFeriado;
import br.edu.ifpb.controle.ControleUsuario;
import br.edu.ifpb.controle.ControleUsuarioAdmin;
import br.edu.ifpb.enums.PapelUser;
import br.edu.ifpb.medelo.Feriado;
import br.edu.ifpb.medelo.Usuario;
import br.edu.ifpb.medelo.ValidaUser;
import java.io.File;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author José
 */
public class Teste {
    public static void main(String[] args) {
        ControleUsuarioAdmin a = new ControleUsuarioAdmin();
        ControleFeriado c= new ControleFeriado();
      if(  ValidaUser.validarEmail("exemplo@ifpb.edu.br"))
        System.out.println("email valido");
      else
            System.err.println("email invalido");
        //a.addUsuario(new Usuario("000001", "maria", "maria@gmail", "AS123as@", "/../", true, PapelUser.ALUNO));
       // c.adiciona(new Feriado(LocalDate.of(2016, 01, 23), "agora"));
      
              
   //  c.importFeriado(InputStream("D://feriados.csv"), true);
     // boolean x=  a.editarUsuario(new Usuario("000001", "Ana Gloria", "maria@gmail", "AS123as@", "/../", true, PapelUser.ALUNO));
      //  System.out.println("cadastrou "+x);
     Usuario u =   a.login("Ana Gloria", "AS123as@");
        System.out.println(" usuario logado " +u);
    // boolean x=   ValidaUser.validarEmail("jose_m@ai.com");
      //  System.out.println("email  "+x);
        
         
        
    }

    private static InputStream InputStream(String dferiadoscsv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}
