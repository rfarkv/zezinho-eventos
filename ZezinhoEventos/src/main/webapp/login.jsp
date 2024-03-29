<!DOCTYPE html>
<html lang="pt" xmlns="http://www.w3.org/1999/xhtml"  >
    <head>
        <title> Zezinho Eventos - Login</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/favicon.ico"  />
        <!--===============================================================================================-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/animsition@4.0.2/dist/css/animsition.min.css" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <!--===============================================================================================-->
    </head>
    <body>
        
        
		<div class="container-fluid corpo">
			<div class="row justify-content-md-center h-100 p-5">
				<div class="card-wrapper">
					<div class="brand text-center">
                                              <h1 class="logo-badge text-whitesmoke"><span class="fa fa-user-circle"></span></h1>
						<!--<img src="img/logo.jpg" alt="logo">-->
					</div>
                                      <% if (request.getAttribute("mensagem") != null) { %>
                                    <div class="alert alert-success">
                                        <%= request.getAttribute("mensagem") %>                                        
                                    </div>
                                    <% } %>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Login</h4>
							<form method="POST" class="my-login-validation" 
                                                              action="control">
                                                            <input type="hidden" name="ac" value="login"/>
                                                           
								<div class="form-group">
									<label for="email">Login</label>
									<input value="zezin" id="login" type="text" class="form-control" name="cpLogin" value="" required="" autofocus="" kl_ab.original_type="email">
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>

								<div class="form-group">
									<label for="password">Password
									</label>
									<div style="position:relative" id="eye-password-0">
                                                                            <input value="123" id="password" type="password" class="form-control" name="cpSenha" required="" data-eye="" style="padding-right: 60px;"><div class="invalid-feedback">
								    	Password is required
							    	</div><input type="hidden" id="passeye-0"><div class="btn btn-primary btn-sm" id="passeye-toggle-0" style="position: absolute; right: 10px; top: 7px; padding: 2px 7px; font-size: 12px; cursor: pointer;">Show</div></div>
								    <div class="invalid-feedback">
								    	Password is required
							    	</div>
								</div>

                                                            <%
                                                                String error = request.getParameter("error");
                                                                if (error != null){
                                                                %>
                                                                    <div class="form-group">
                                                                    <label for="remember" >Login ou senha incorreta!</label>
                                                                    </div>
                                                                <%
                                                                    }
                                                                %>
								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								</div>
								<div class="mt-4 text-center">
									<a href="control?ac=cad">Cadastre-se</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer text-center">
						Zezinho Eventos 2077
					</div>
				</div>
			</div>
		</div>
	

        <!--===============================================================================================-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

        <!--===============================================================================================-->
        <script src="https://cdn.jsdelivr.net/npm/animsition@4.0.2/dist/js/animsition.min.js"></script>
        <!--===============================================================================================-->

    </body>
</html>
