<%-- 
    Document   : repertuar
    Created on : 2018-05-05, 11:27:38
    Author     : Bartek
--%>

<%@page import="Kino.Wersja"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Kino.Database"%>
<%@page import="Kino.Film"%>
<%@page import="Kino.Seans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kino Planeta</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>        
            <div class="logo">
                    <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
<div class="zawartosc">           
            <ul class="menu" id="menu">
            </ul>

    <section>
        <article>
                     <% 
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date dzis = new Date();
                        Date wybrana = new Date();
                        Date jutro = new Date() ;
                        Date dwa = new Date() ;
                        Date trzy = new Date() ;
                        Date cztery = new Date() ;
                        Date piec = new Date() ;
                        Date szesc = new Date() ;
                        jutro.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 );
                        dwa.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 2);
                        trzy.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 3 );
                        cztery.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 4 );
                        piec.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 5);
                        szesc.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 6);     
        %>
           <button onclick="myFunction(1)" type="button"><%String ds = dateFormat.format(dzis); out.println(ds);%></button>
           <button onclick="myFunction(2)" type="button"><%String jt = dateFormat.format(jutro); out.println(jt);%></button>
           <button onclick="myFunction(3)" type="button"><%String dw = dateFormat.format(dwa); out.println(dw);%></button>
           <button onclick="myFunction(4)" type="button"><%String tr = dateFormat.format(trzy); out.println(tr);%></button>
           <button onclick="myFunction(5)" type="button"><%String cz = dateFormat.format(cztery); out.println(cz);%></button>
           <button onclick="myFunction(6)" type="button"><%String pi = dateFormat.format(piec); out.println(pi);%></button>
           <button onclick="myFunction(7)" type="button"><%String sz = dateFormat.format(szesc); out.println(sz);%></button>
           <button type="button">Wybierz datę<%// Tu sie ma kalendarz otwierać%> </button>
              
           <script>
function myFunction(i) {
  document.getElementById("demo").innerHTML = "Hello World";
}
</script>
        </article>
        <article> 
         Repertuar dla Dnia: <%String wyb = dateFormat.format(wybrana); out.println(wyb); // TU TRZEBA DOPASOWAĆ z wybrana data%> 
        
         
        </article>
        <article>
          <table>
               <%
                Database.polacz();
                ArrayList<Seans> seanse = Database.readSeanse();
                ArrayList<Film> filmy = Database.readFilmy();
                ArrayList<Wersja> wersje = Database.readWersje();
                int pom1=0;
                for(int i=0;i<seanse.size();i++)
                   {     
                       String s = seanse.get(i).getData();
                       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
                       Date date = sdf.parse(s);
                       String g = wybrana.toString();
                       String wybr = dateFormat.format(wybrana);
                       
                       
                       // Tu warunek IF że data taka jak wybrana if(seanse.get(i).getData()==wybrana)
                      if(s.contains(wybr.toString()))
                      {
                        out.println("<tr><td width='40%'>" +filmy.get(seanse.get(i).getIdFilmu()).getTytul() +
                                "</td><td width='20%'>" + wersje.get(seanse.get(i).getIdWersji()).getTekst()  +
                                "</td><td width='40%'><button type='button'>"+ s +
                                "</button></td></tr> ");
                        pom1++;
                      }
                     
                   }
                 if(pom1==0)
                      {
                          out.println("NIE MA ŻADNYCH SEANSÓW W WYBRANEJ DACIE");
                      }
                Database.zamknij();
            %>
         </table>
        </article>
    </section>
    <footer>
        Made by LA,SM,ŻB. All rigths reserved :) 
    </footer>
</div>
<script src="menu.js"></script>
</body>
</html>
