<%@ page import="java.util.*, Dao.*, Servlets.*, javazoom.upload.*" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
	CaronaOferecidaDAO carofdao = new CaronaOferecidaDAO();
	ArrayList<CaronaOferecida> recentes = carofdao.getNovas(); 
%>


<html lang="en">
<head>
<title>Home</title>

<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Didact_Gothic_400.font.js"></script>
<script type="text/javascript" src="js/Shanti_400.font.js"></script>
<script src="js/roundabout.js" type="text/javascript"></script>
<script src="js/roundabout_shapes.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.2.js" type="text/javascript"></script>
<script type="text/javascript" src="js/script.js"></script>
<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<style type="text/css">
		.bg {behavior:url(js/PIE.htc)}
	</style>
<![endif]-->
<!--[if lt IE 7]>
	<div style=' clear: both; text-align:center; position: relative;'>
		<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
	</div>
<![endif]-->
</head>
<body id="page1">
<%
	UsuarioDAO dao = new UsuarioDAO();
	if (session.getAttribute("usuario")!=null){
%>
		<meta http-equiv="refresh" content="0; url=usuarioLogado.jsp"> 
<%
	}else{
%>
<div class="body1">
	<div class="main">
<!-- header -->
		<header>
			<div class="wrapper">
				<nav>
					<ul id="top_nav">
						<li><a href="login.jsp">Login</a></li>
						<li><a href="#">FAQs</a></li>
						<li class="#"><a href="#">Contato</a></li>
					</ul>
				</nav>
				<span class="date">Monday, June 6, 2011  &nbsp; &nbsp; 17:19</span>
			</div>
			<div class="wrapper">
				<h1><a href="index.jsp" id="logo">Pro Soft</a></h1>
				<nav>
					<ul id="menu">
						<li id="menu_active"><a href="index.jsp" ><span><span>Home</span></span></a></li>
						<li class="nav2"><a href="#"><span><span>Sobre</span></span></a></li>
						<li class="nav3"><a href="adiciona_usuario.jsp"><span><span>Cadastro</span></span></a></li>
						<li class="nav4"><a href="login.jsp"><span><span>Login</span></span></a></li>
						<li class="nav5"><a href="#"><span><span>Contato</span></span></a></li>
					</ul>
				</nav>
			</div>
			<div class="wrapper">
				<div class="text">
					<span class="tittle">Pra<span>Onde</span></span>
					<p>Não deixe de ir para onde você precisa!<span></span></p>
					<a href="#" class="button1">Conheç‡a</a>
				</div>
				<!--<div id="gallery">
				<!--	<ul id="myRoundabout">
				<!--		<li><img src="images/img1.png" alt=""></li>
				<!--		<li></li>
				<!--		<li><img src="images/img3.png" alt=""></li>
				<!--	</ul> ! -->
				<!--</div>-->
			</div>
		</header>
<!-- content -->
		<article id="content">
			<section class="col1">
				<h2>Novidades</h2>
				<div class="wrapper pad_bot2">
					<figure class="left marg_right1"><a href="#"><img src="images/page1_img1.jpg" alt=""></a></figure>
					<p class="pad_bot1 pad_top1"><span class="color1">Tue, June 7, 2011</span></p>
					<p>PraOnde em busca de parcerias com postos de gasolina.</p>
				</div>
				<div class="wrapper pad_bot2">
					<figure class="left marg_right1"><a href="#"><img src="images/page1_img2.jpg" alt=""></a></figure>
					<p class="pad_bot1 pad_top1"><span class="color1">Sun, June 5, 2011</span></p>
					<p>Aparecemos no Jornal Nacional! Veja.</p>
				</div>
				<div class="wrapper">
					<figure class="left marg_right1"><a href="#"><img src="images/page1_img3.jpg" alt=""></a></figure>
					<p class="pad_bot1 pad_top1"><span class="color1">Thu, June 2, 2011</span></p>
					<p>PraOnde obtém seus primeiros mil usuários!</p>
				</div>
       		</section>
       		<%
       			if (recentes!=null && recentes.size()>0){
       		%>
       		<section class="col2">
				<h2 class="pad_bot1">Caronas recentes</h2>
			<%
   					for (CaronaOferecida carona : recentes){
   						UsuarioDAO udao = new UsuarioDAO();
   						Usuario usu = udao.getById(carona.getIdUsuario());
   						
   						VeiculoDAO veidao = new VeiculoDAO();
   						Veiculo vei = veidao.getVeiculo(carona.getIdCarro());  
   						
   						String foto = usu.getFoto(); 				

						
       		%>
			 
				<div class="wrapper">
					<figure class="left marg_right1"><img src="fotos/usuarios/<%=foto%>" width=100/></figure>
					<p class="pad_top1 pad_bot1"><strong class="color1">DE: <%=carona.getOrigem()%> </strong></p>
					<p class="pad_top1 pad_bot1"><strong class="color1">PARA: <%=carona.getDestino()%> </strong></p>
					<p class="pad_bot3"> Usuário: <%=usu.getEmail()%>.</p>
					<p class="pad_bot3"> Carro: <%=vei.getMarca()+" - "+vei.getModelo()%>.</p>
					<a href="busca_carona3.jsp?idCaronaOferecida=<%=carona.getIdCaronaOferecida()%>" class="button right">Ver carona</a>
				</div>
			<%
				}
					}
			%>
       		</section>
       		
		</article>
	</div>
</div>
<div class="body2">
	<div class="main">
		<article id="content2">
			<section class="col1">
				<h3>Newsletter</h3>
				<form id="newsletter">
					<div>
						<div class="bg">
							<input class="input" type="text" value="Type Your Email Here"  onblur="if(this.value=='') this.value='Type Your Email Here'" onfocus="if(this.value =='Type Your Email Here' ) this.value=''">
						</div>
						<a href="#" class="button" onclick="document.getElementById('ContactForm').submit()">Assinar</a>
					</div>
				</form>
        	</section>
			<section class="col_1">
				<h3>Como fazer?</h3>
				<ul class="list1">
					<li><a href="#">Cadastre-se</a></li>
					<li><a href="#">Ofereça uma carona</a></li>
					<li><a href="#">Peça uma carona</a></li>
				</ul>
        	</section>
			<section class="col_2">
				<h3>Siga-nos</h3>
				<ul id="icons">
					<li><a href="#"><img src="images/icon1.jpg" alt="">Facebook</a></li>
					<li><a href="#"><img src="images/icon2.jpg" alt="">Twitter</a></li>
					<li><a href="#"><img src="images/icon3.jpg" alt="">LinkedIn</a></li>
				</ul>
        	</section>
		</article>
<!-- / content -->
	</div>
</div>
<div class="main">
<!-- footer -->
	<footer>
		<a rel="nofollow" href="http://www.grupocep.com.br/" target="_blank">Arte e Design</a> por Grupo C&P 
		<a href="#" target="_blank">PraOnde</a> todos os direitos reservados
		<!-- {%FOOTER_LINK} -->
	</footer>
<!-- / footer -->
</div>
<script type="text/javascript"> Cufon.now();</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myRoundabout').roundabout({
			 shape: 'square',
        	 minScale: 0.89, // tiny!
        	 maxScale: 1, // tiny!
			 easing:'easeOutExpo',
			 clickToFocus:'true',
			 focusBearing:'0',
			 duration:800,
			 reflect:true
		});
	});
<%}%>
</script>
</body>
</html>