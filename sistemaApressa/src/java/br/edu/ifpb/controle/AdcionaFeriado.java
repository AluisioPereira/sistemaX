/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpb.controle;

import br.edu.ifpb.execao.FeriadoException;
import br.edu.ifpb.medelo.AdicionaFeriadoBo;
import br.edu.ifpb.valueObjects.Feriado;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author José
 */
@WebServlet(name = "CadastraFeriado", urlPatterns = {"/CadastraFeriado"})
public class AdcionaFeriado extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String nome = request.getParameter("nome");
            String data = request.getParameter("data");
            AdicionaFeriadoBo BO = new AdicionaFeriadoBo();

            Feriado feriado = new Feriado(LocalDate.parse(data, DateTimeFormatter.ISO_DATE), nome);
            JOptionPane.showMessageDialog(null, "crio" + feriado.toString());
            BO.addFeriado(feriado, false);

        } catch (FeriadoException e) {

        }
    }

}
