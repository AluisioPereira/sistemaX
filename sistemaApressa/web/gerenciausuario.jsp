<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="br.edu.ifpb.DAO.UsuarioAdmDAO"%>
<%@page import="br.edu.ifpb.valueObjects.Usuario"%>
<html lang="PT-BR">  <!--  -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html">
        <meta http-equiv="refresh" content="200">
        <meta name="author" content="Zilderlan Leite, Ferreira, Aluisio Pereira">
        <meta name="" content="">
        <meta name="" content="">
        <title>Gerenciamento de Usu�rios</title>

        <%
            Usuario usuario = (Usuario) session.getAttribute("user");
        %>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style type="text/css">
            @import "css/jquery.dataTables.css";
        </style>
        <script src="js/ajax.js"></script>
        <script src="js/tabela.js"></script>
        <script src="js/jquery.js"></script>
        <script  src="js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function () {
                $('#tb').dataTable();
            });

//            function redireciona('.remove'){
//                location.href = 'ServletExcluirUsuario';
//                alert('inok');
//            };

        </script>


    </head>




    <header> <!--  -->

        <div class="content-top">
            <div class="content-left">
                <h2> Nome do Sistema</h2>
                <img src="img/user.jpg" title="foto perfil">
                <h3> Logado como <code>Codigo</code></h3>

            </div>

            <div class="content-right">
                <h3> Nome Usu�rio</h3>
                <img src="img/user.jpg">
                <ul >
                    <li><a href="#edita" class="perfil">Editar Perfil</a></li>
                    <li><a href="/logout" class="exit">Sair</a></li>
                </ul>

            </div>

        </div>

        <div class="content-bottom" >
            <button type="button" class="edit" id="" onclick="document.getElementById('user-add').style.display = 'block';">
                <img src="img/add.jpg" title="">
            </button>
            <button type="button" class="edit" id="" onclick="document.getElementById('user-update').style.display = 'block';">           			
                <img src="img/edit.jpg" title>
            </button>
            <form action="ServletExcluirUsuario" method="post" class="delete-user">
                <input class='formContato' type='text' name='delete' id='delete' value='Assunto' onchange="alteraDiv()">

                <button class="remove" type="submit"  >
                    <img src="img/remove.png" title="">
                </button>

            </form>

        </div>


    </header>

    <article>


        <!-- -->
        <section id="user-add">


            <form action="CadastroUser " method="post" id=""class="form-add">
                <img src="user.jpg" title="" class="photo">
                <h4>Carregar Foto</h4>
                <input type="file" name="foto"  class="btn-file" id="btn-file" onchange="document.getElementById('file-falso').value = this.value;">
                <label class="name">Nome de Usu�rio</label>
                <input for=" " type="text" name="name" placeholder="Ex:Antonio Marques" class="" id="name">  

                <label class="senha" >Senha</label>
                <input for=" " type="password" name="senha" placeholder="Ex: Anderc4ma5" class="" id="senha"> 

                <label class="email" >Email</label>
                <input  type="email" placeholder="Ex: zilderlan@meuemail.com" name="email" id="email"> 

                <label class="matricula" >Matricula</label>
                <input  type="text" placeholder="Ex: 123456" name="matricula" id="matricula"> 

                <label class="tipo" >Tipo</label>
                <select  type="select" name="papel"  id="papel" > 
                    <option value="">Selecione</option>
                    <option value="ADMISTRAD0R">admin</option>
                    <option value="ALUNO">aluno</option>
                    <option value="ASSISTENTE_SALA">assistente de sala</option>
                    <option value="PROFESSOR">professor</option>
                    <option value="MONITOR">monitor</option>
                </select>


                <input for=" " type="button" name="" value="Cancelar" class="cancel" id="" onclick="document.getElementById('user-add').style.display = 'none';"> 
                <input for=" " type="submit" name="" value="Cadastrar" class="submit" id="">       		
            </form >

        </section>

        <section id="user-update">
            <div class="modal-body">

                <form action=" EditaUsuario" method="post" id="edita" class="form-update">
                    <img src="user.jpg" title="" class="photo">
                    <h4>Carregar Foto</h4>
                    <input name="imagem" id="imagem" class="file" type="file" multiple data-min-file-count="1">

                    <label class="name-u">Nome de Usu�rio</label>
                    <input for=" " type="text" name="name" placeholder="Ex:Antonio Marques" class="" id="name-u">  

                    <label class="senha-u" >Senha</label>
                    <input for=" " type="password" name="" placeholder="Ex: Anderc4ma5" class="" id="senha-u"> 

                    <label class="email-u" >Email</label>
                    <input for=" " type="email" placeholder="Ex: zilderlan@meuemail.com" name="" class="" id="email-u"> 

                    <label class="tipo-u" >Tipo</label>
                    <select for=" " type="select" name="select" class="" id="tipo-u" > 
                        <option value="">Selecione</option>
                        <option value="Administrador">Administrador</option>
                        <option value="Aluno">Aluno</option>
                    </select>


                    <input for=" " type="button" name="" value="Cancelar" class="cancel-u" id="" onclick="document.getElementById('user-update').style.display = 'none';"> 
                    <input for=" " type="submit" name="" value="Cadastrar" class="submit-u" id="">       		
                </form >
        </section>

        <section clas="user-table">

            <div class="table">
                <table id="tb">
                    <thead>
                        <tr class="tr">
                            <th>Matricula</th>
                            <th>Nome</th>
                            <th>E-mail</th>
                            <th>papel</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            UsuarioAdmDAO queryUsuario = new UsuarioAdmDAO();
                            List<Usuario> usuarios = queryUsuario.buscaTotosUsuarios();

                            Collections.sort(usuarios);

                            for (Usuario u : usuarios) {
                                out.print("<tr onclick=\"displayData(" + ")\" >");
                                out.print("<th>" + u.getMatricula() + "</th>");
                                out.print("<th>" + u.getNome() + "</th>");
                                out.print("<th>" + u.getEmail() + "</th>");
                                out.print("<th>" + u.getPapel().name() + "</th>");
                                out.print("<th>" + u.getStatus() + "</th>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
                <script type="text/javascript">

                    function show_success() {
                        $('#sucessModal').modal({
                            show: 'true'
                        });
                    }

                    function show_error(textError) {
                        $('p#error-body').html(textError);
                        $('#errorModal').modal({
                            show: 'true'
                        });
                    }

                    $(document).ready(function EOQ() {
                    <%
              Integer aux = (Integer) session.getAttribute("operacao");
              session.setAttribute("operacao", null);
              String erro = (String) session.getAttribute("erro");
              session.setAttribute("erro", null);
                    %>
                        var c = <%=aux%>;
                        var d = "<%=erro%>";
                        if (c == 1) {
                            show_success();
                        } else if (d !== "null") {
                            show_error(d);
                        }
                    });

                    function displayData(idee) {
                        $.ajax({
                            url: "editar_usuario",
                            type: "POST",
                            data: {ide: idee},
                            success: function (data) {
                                var valores = data.split("#break#");
                                $("#nome_edit").val(valores[0]);
                                $("#nome_delet").val(valores[0]);
                                $("#email_edit").val(valores[1]);
                                $("#mtr_edit").val(valores[2]);
                                $("#papel_edit").val(valores[3]);

                                $("#delete_modal").attr("action", "excluir_usuario");
                                $(":input#dados").val(idee);

                                if (valores[3].localeCompare("ADMINISTRADOR")) {
                                    $("#papel_edit").prop("disabled", false);
                                } else {
                                    $("#papel_edit").prop("disabled", true);
                                }
                            }
                        });
                    }
                    ;
                </script>


                <!--        		 
                       
                                        </tbody>
                
                                </table>
                            </div>
                
                        </section>
                        </article>
                    </body>
                </html>