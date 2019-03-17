<%@ include file="/init.jsp" %>

<%@page import="javax.portlet.filter.RenderRequestWrapper"%>
<%@page import="javax.portlet.RenderRequest"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
<portlet:actionURL var="InformationEmail" name="sendMail"/>

<liferay-ui:success key="success" message="Richiesta inviata,controllare la mail"/>
<liferay-ui:error key="error" message="L'operazione non è andata a buon fine,il captcha non è stato verificato (Dimostra di non essere un robot)"/>

<html lang="en" dir="ltr">
	<head>
	 		<meta charset="utf-8" />
 			<script src="https://www.google.com/recaptcha/api.js?hl=it" async defer></script> 
	</head>
	
	<body>
		
		<div class="col-md-10" style="margin-left: 5%">
			<h1>Scegliere il tipo di richiesta che vuoi inviare</h1>
		</div>
		
		<form name="EffettuaRichiesta" action="${InformationEmail}" method="POST" enctype="multipart/form-data" style="margin-left: 5%"> 	
		
			<div class="col-md-10">
				<div class="row">
					<div class="col-11">
						<select class="col-md-12" id="ScegliTipologia" style="padding-left:0px" name="<portlet:namespace/>Subject">
							<option>--Scegli la tipologia della richiesta--</option>
							<option value="Richiesta di informazioni">Richiesta di informazioni</option>
							<option value="Richiesta di supporto tecnico">Richiesta di supporto tecnico</option>
						</select>
					</div>
					<div class="col-1"><img  id ="Soggetto" src ="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px" onClick="Help(this.id);"></div>
				</div>	 
			</div><br><br>
				
			<div class="col-md-10" id="RichiestaInformazioni">
				
				<div>
					<h3 class="col-10">Compila i campi di questo modulo</h3>
				</div>
				
				<div class="form-group">
					<label class="col-10">Nome</label>
					<div class="row">
						<div class="col-11"><input type="text" class = "form-control" pattern="[a-zA-Z]+" title="Attenzione: il tuo nome può contenere solo lettere, prova a scriverlo di nuovo" id="InfoNome" name="<portlet:namespace/>Name"></div>
						<div class="col-1"><img id ="Nome" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-10">Cognome</label>
					<div class="row">
						<div class="col-11"><input type="text" class = "form-control"  id="InfoCognome"  pattern="[a-zA-Z]+" title="Attenzione: il tuo cognome può contenere solo lettere, prova a scriverlo di nuovo" name="<portlet:namespace/>Lastname"></div>
						<div class="col-1"><img id ="Cognome" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-10">Codice Fiscale</label>
					<div class="row">
						<div class="col-11"><input type="text" class = "form-control"  id="InfoCF"   title="Per vedere come scrivere il codice fiscale, clicca sul punto interrogativo"  name="<portlet:namespace/>CF" maxlength="16"></div>
						<div class="col-1"><img id ="CF" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div class="form-group"><br>	
					<label class="col-10">Categoria utente</label>		
					<div class="row">
						<div class="col-11">
							<select class="col-md-12" id="InfoUtente"  name="<portlet:namespace/>Users" style="padding-left:0px">
								<option value="">--Seleziona l'utente--</option>
								<option value="Cittadino">Cittadino</option>
								<option value="Operatore - Centro per l'impiego">Operatore - Centro per l'impiego</option>
								<option value="Operatore - Altro">Operatore - Altro</option>
								<option value="Datore di lavoro">Datore di lavoro</option>
							</select>
						</div>
						<div class="col-1"><img id ="Utente" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
						
				<div class="form-group">
					<label class="col-10">Oggetto della richiesta</label>
					<div class="row">
						<div class="col-11">
							<select class="col-md-12" id="InfoCategoria" name="<portlet:namespace/>Categories" style="padding-left:0px">
								<option value="">--Scegli la categoria--</option>
								<option>Agenzia per il lavoro</option>
								<option>Assegno di Ricollocazione</option>
								<option>Carriere e professioni</option>
								<option>Contratti e forme di lavoro</option>
								<option>Contributi,agevolazione,incentivi all'assunzione</option>
								<option>Disoccupazione e ricollocazione</option>
								<option>Garanzia Giovani</option>
								<option>Intermediazione AdR</option>
								<option>Lavoro all'estero e EURES</option>
								<option>Lavoro dipendente</option>
								<option>Norme e leggi sul lavoro</option>
								<option>Orientamento e formazione professionale</option>
								<option>Portale Anpal</option>
								<option>Reddito di cittadinanza</option>
								<option>Società partecipate</option>
								<option>Altro</option>
							</select>
						</div>
						<div class="col-1"><img id ="Categoria" onClick="Help(this.id);"src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-10">Descrivi la tua richiesta</label>
					<div class="row">
						<div class="col-11"><textarea rows = "2" cols = "96" class="form-control" name="<portlet:namespace/>Body" id="InfoBody"></textarea></div>
						<div class="col-1"><img  id ="Oggetto" src ="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px" onClick="Help(this.id);"></div>
					</div>
				</div>
				
				<div>
					<label class="col-10">Inserisci eventuali allegati (Grandezza massima file 1MB)</label>
					<div class="row">
						<div class="col-2"><input type="file" name="File" multiple="multiple"></div>
						<div class="col-9"></div>
						<div class="col-1"><img id ="Files" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
					<div class="col-10" id="ElencoAllegatiInformazioni"></div>
				</div><br>
				
				<div class="form-group">
					<label class="col-10">Email</label>
					<div class="row">
						<div class="col-11"><input type="Email" class = "form-control" id="InfoEmail"  placeholder="email@email.dominio" name="<portlet:namespace/>Email"></div>
						<div class="col-1"><img id ="Email" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-10">Telefono</label>
					<div class="row">
						<div class="col-11"><input type="tel" class = "form-control" id="InfoTel" pattern="^[0-9-+s()]*$"  title ="Attenzione: il numero di telefono può contenere solo numeri: prova a scriverlo di nuovo" name="<portlet:namespace/>Telefono"></div>
						<div class="col-1"><img id ="Telefono" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
						
			</div> 
			
			<div class="col-md-10" id = "RichiestaSupporto">
				
				<div>
					<h3 class="col-10">Compila i campi di questo modulo</h3>
				</div>
				
				<div class="form-group">
					<label class="col-10">Nome</label>
						<div class="row">
							<div class="col-11"><input type="text" class = "form-control" id="SupportoNome" pattern="[a-zA-Z]+" title="Attenzione: il tuo nome può contenere solo lettere, prova a scriverlo di nuovo" name="<portlet:namespace/>SecondName"></div>
							<div class="col-1"><img id ="Nome" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-10">Cognome</label>
						<div class="row">
							<div class="col-11"><input type="text" class = "form-control" id="SupportoCognome" pattern="[a-zA-Z]+" title="Attenzione: il tuo nome può contenere solo lettere, prova a scriverlo di nuovo" name="<portlet:namespace/>SecondLastname"></div>
							<div class="col-1"><img id ="Cognome" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-10">Codice Fiscale</label>
						<div class="row">
							<div class="col-11"><input type="text" class = "form-control" id="SupportoCF"  maxlength="16" title="Per vedere come scrivere il codice fiscale..cliccare sul punto interrogativo adiacente" name="<portlet:namespace/>SecondCF"></div>
							<div class="col-1"><img id ="CF" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
						</div>
				</div>
				
				<div class="form-group"><br>
					<label class="col-10">Categoria Utente</label>			
					<div class="row">
						<div class="col-11">
							<select class="col-md-12" id="SecondUser"  name="<portlet:namespace/>SecondUser" style="padding-left:0px">
								<option value="">--Seleziona l'utente--</option>
								<option value="Cittadino/a">Cittadino/a</option>
								<option value="Operatore/trice">Operatore/trice</option>
								<option value="Datore/trice di lavoro o autonomo/a">Datore/trice di lavoro o autonomo/a</option>
							</select>
						</div>
						<div class="col-1"><img id ="Utente" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div class="col-10"><label>Specifica la tua richiesta scegliendo le voci proposte dai menu</label></div>
				
				<div class="row">		
					<div class="col-11">
						<select class="col-md-12" id = "groups" name="<portlet:namespace/>SecondCategories" style="padding-left:0px">
							<option data-group="SHOW" value="">--Oggetto della richiesta--</option>
							<option data-group="Cittadino/a,Operatore/trice" value="ADR CIGS">ADR CIGS</option>
							<option data-group="Cittadino/a,Operatore/triceOperatore" value="ADR NASPI">ADR NASPI</option>
							<option data-group="Cittadino/a,Operatore/trice" value="DID ONLINE">DID ONLINE</option>
							<option data-group="Cittadino/a,Operatore/trice" value="GARANZIA GIOVANI">GARANZIA GIOVANI</option>
							<option data-group="Operatore/trice" value="ALBO INFORMATICO">ALBO INFORMATICO</option>
							<option data-group="Cittadino/a,Operatore/trice,Datore/trice di lavoro o autonomo/a" value="INCROCIO DOMANDA OFFERTA">INCROCIO DOMANDA OFFERTA</option>
							<option data-group="Operatore/trice,Datore/trice di lavoro o autonomo/a" value="COMUNICAZIONI OBBLIGATORIE">COMUNICAZIONI OBBLIGATORIE</option>
							<option data-group="Datore/trice di lavoro o autonomo/a" value="COMUNICAZIONI OBBLIGATORIE - UNIMARE">COMUNICAZIONI OBBLIGATORIE - UNIMARE</option>
							<option data-group="Cittadino/a,Operatore/trice,Datore/trice di lavoro o autonomo/a" value="MyANPAL">MyANPAL</option>
							
						</select>
					</div>
					<div class="col-1"><img id ="Categoria" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
				</div><br>
				
				<div class="row">
					<div class="col-11">
						<select class="col-md-12" id="sub_groups" name="<portlet:namespace/>SubCategories" style="padding-left:0px">
							<option data-group="SHOW" value="">--Scegli la categoria--</option>
							
							<option data-group="ADR CIGS,Cittadino/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="ADR CIGS,Cittadino/a" value="Credenzia di accesso">Credenzia di accesso</option>
							<option data-group="ADR CIGS,Cittadino/a" value="Prenotazione">Prenotazione</option>
							<option data-group="ADR CIGS,Cittadino/a" value="Richiesta(completamento domanda)">Richiesta(completamento Domanda)</option>
							<option data-group="ADR CIGS,Cittadino/a" value="Stato richieste(Le tue richieste)">Stato richieste(Le tue richieste)</option>
							<option data-group="ADR CIGS,Cittadino/a" value="Cambio Sede">Cambio Sede(Cittadino)</option>
							
							<option data-group="ADR CIGS,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Credenzia di accesso">Credenzia di accesso</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Primo Appuntamento">Primo Appuntamento</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Tutor">Tutor</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Definizione PRI">Definizione PRI</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Esito attività">Esito attività</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Offerta occupazionale">Offerta occupazionale</option>
							<option data-group="ADR CIGS,Operatore/trice" value="Proroga">Proroga</option>
							
							
							<option data-group="ADR NASPI,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Agenda">Agenda</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Appuntamento">Appuntamento</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Tutor">Tutor</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Silenzio assenso">Silenzio assenso</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Richiesta duplicata">Richiesta duplicata</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Programma di ricerca intensiva - Pri">Programma di ricerca intensiva Pri</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Proroga">Proroga</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Offerte occupazionali">Offerte occupazionali</option>
							<option data-group="ADR NASPI,Operatore/trice" value="Cambio stato">Cambio stato</option>
							
							<option data-group="ADR NASPI,Cittadino/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="ADR NASPI,Cittadino/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="ADR NASPI,Cittadino/a" value="Cambio stato">Cambio sede</option>
							
							<option data-group="DID ONLINE,Cittadino/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="DID ONLINE,Cittadino/a" value="Credenziali di accesso">Credenziali di accesso</option>
							
							<option data-group="DID ONLINE,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="DID ONLINE,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>							
							<option data-group="DID ONLINE,Operatore/trice" value="Intermediata">Intermediata</option>
							<option data-group="DID ONLINE,Operatore/trice" value="Revoca">Revoca</option>
							<option data-group="DID ONLINE,Operatore/trice" value="SAP">SAP</option>
							<option data-group="DID ONLINE,Operatore/trice" value="Agenda">Agenda</option>
							
							
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="Adesione">Adesione</option>
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="Blocco Tecnico">Blocco Tecnico</option>
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="Stati dell'adesione">Stati dell'adesione</option>
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="SAP">SAP</option>
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="Iscrizione">Iscrizione</option>
							<option data-group="GARANZIA GIOVANI,Operatore/trice" value="Incentivo Neet">Incentivo Neet</option>
							
							<option data-group="GARANZIA GIOVANI,Cittadino/a" value="Adesione">Adesione</option>
							<option data-group="GARANZIA GIOVANI,Cittadino/a" value="Blocco Tecnico">Blocco Tecnico</option>
							<option data-group="GARANZIA GIOVANI,Cittadino/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="GARANZIA GIOVANI,Cittadino/a" value="Iscrizione">Iscrizione</option>
							<option data-group="GARANZIA GIOVANI,Cittadino/a" value="Incentivo">Incentivo Neet</option>
							
							
							<option data-group="ALBO INFORMATICO,Operatore/trice" value="Blocco Tecnico">Blocco Tecnico</option>
							<option data-group="ALBO INFORMATICO,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="ALBO INFORMATICO,Operatore/trice" value="Iscrizione Albo Agenzia del lavoro">Iscrizione Albo Agenzia del lavoro</option>
							<option data-group="ALBO INFORMATICO,Operatore/trice" value="SAP">SAP</option>
							
							<option data-group="INCROCIO DOMANDA OFFERTA,Cittadino/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="INCROCIO DOMANDA OFFERTA,Cittadino/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="INCROCIO DOMANDA OFFERTA,Cittadino/a" value="Curriculum vitae">Curriculum vitae</option>
							
							<option data-group="INCROCIO DOMANDA OFFERTA,Datore/trice di lavoro o autonomo/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="INCROCIO DOMANDA OFFERTA,Datore/trice di lavoro o autonomo/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="INCROCIO DOMANDA OFFERTA,Datore/trice di lavoro o autonomo/a" value="Ricerca di personale">Ricerca di personale</option>
							
							<option data-group="INCROCIO DOMANDA OFFERTA,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="INCROCIO DOMANDA OFFERTA,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="INCROCIO DOMANDA OFFERTA,Operatore/trice" value="EURES">EURES</option>
							
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>	
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Unilav">Unilav</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Vardatori">Vardatori</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Uniurg">Uniurg</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Ricerca comunicazioni">Ricerca comunicazioni</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Caricamento massivo">Caricamento massivo</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Operatore/trice" value="Accentramenti">Accentramenti</option>
							
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Unilav">Unilav</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Vardatori">Vardatori</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Uniurg">Uniurg</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Ricerca comunicazioni">Ricerca comunicazioni</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Caricamento massivo">Caricamento massivo</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE,Datore/trice di lavoro o autonomo/a" value="Accentramenti">Accentramenti</option>
							
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Unilav">Unilav</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Vardatori">Vardatori</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Uniurg">Uniurg</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Ricerca comunicazioni">Ricerca comunicazioni</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Datore/trice di lavoro o autonomo/a" value="Caricamento massivo">Caricamento massivo</option>
							
							
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Unilav">Unilav</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Vardatori">Vardatori</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Uniurg">Uniurg</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Ricerca comunicazioni">Ricerca comunicazioni</option>
							<option data-group="COMUNICAZIONI OBBLIGATORIE - UNIMARE,Operatore/trice" value="Caricamento massivo">Caricamento massivo</option>
							
							
							<option data-group="MyANPAL,Cittadino/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="MyANPAL,Cittadino/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="MyANPAL,Cittadino/a" value="Attestazione stato disoccupazione">Attestazione stato disoccupazione</option>
							<option data-group="MyANPAL,Cittadino/a" value="Incentivabilità">Incentivabilità</option>
							<option data-group="MyANPAL,Cittadino/a" value="MyLearning">MyLearning</option>
							<option data-group="MyANPAL,Cittadino/a" value="Profilazione qualitativa">Profilazione qualitativa</option>
							<option data-group="MyANPAL,Cittadino/a" value="Scouting della domanda">Scouting della domanda</option>
							<option data-group="MyANPAL,Cittadino/a" value="Verifica status Neet">Verifica status Neet</option>
							
							<option data-group="MyANPAL,Operatore/trice" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="MyANPAL,Operatore/trice" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="MyANPAL,Operatore/trice" value="Attestazione stato disoccupazione">Attestazione stato disoccupazione</option>
							<option data-group="MyANPAL,Operatore/trice" value="Incentivabilità">Incentivabilità</option>
							<option data-group="MyANPAL,Operatore/trice" value="MyLearning">MyLearning</option>
							<option data-group="MyANPAL,Operatore/trice" value="Profilazione qualitativa">Profilazione qualitativa</option>
							<option data-group="MyANPAL,Operatore/trice" value="Scouting della domanda">Scouting della domanda</option>
							<option data-group="MyANPAL,Operatore/trice" value="Verifica status Neet">Verifica status Neet</option>
							
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Credenziali di accesso">Credenziali di accesso</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Blocco tecnico">Blocco tecnico</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Attestazione stato disoccupazione">Attestazione stato disoccupazione</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Incentivabilità">Incentivabilità</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="MyLearning">MyLearning</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Profilazione qualitativa">Profilazione qualitativa</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Scouting della domanda">Scouting della domanda</option>
							<option data-group="MyANPAL,Datore/trice di lavoro o autonomo/a" value="Verifica status Neet">Verifica status Neet</option>
							
							
						</select>
					</div>
					<div class="col-1"><img id ="SubCategoria" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
				</div><br>
				
				<div class="row">
					<div class="col-11">
						<select class="col-md-12" id="sub_groups_element"  name="<portlet:namespace/>Element" style="padding-left:0px">
							<option data-group="SHOW" value="">--Scegli la sottocategoria--</option>
							
							<option data-group="Appuntamento" value="Inserimento appuntamento retrodatato">Inserimento appuntamento retrodatato</option>
							<option data-group="Appuntamento" value="Data appuntamento uguale data inserimento Adr">Data appuntamento uguale data inserimento Adr</option>
							<option data-group="Appuntamento" value="Impossibile registrare esito appuntamento">Impossibile registrare esito appuntamento</option>
							<option data-group="Appuntamento" value="Impossibile inserire appuntamento">Impossibile inserire appuntamento</option>		
							
							<option data-group="Programma di ricerca intensiva - Pri" value="Programma di ricerca intensiva righe duplicate">Programma di ricerca intensiva righe</option>
							<option data-group="Programma di ricerca intensiva - Pri" value="Programma di ricerca intensiva stampa non funzionante">Programma di ricerca intensiva stampa non funzionante</option>
						
						</select>
					</div>
					<div class="col-1"><img id ="ElementoCategoria" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
				</div><br>
				
				<div class="form-group">
					<label class="col-10">Descrivi la tua richiesta</label>
					<div class="row">
							<div class="col-11"><textarea rows = "2" cols = "96" class="form-control" name="<portlet:namespace/>SecondBody" id="SupportoBody"></textarea></div>
							<div class="col-1"><img id ="Oggetto" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
				</div>
				
				<div>
					<label class="col-10">Allegati(Grandezza massima file 1MB)</label>
					<div class="row">
						<div class="col-2"><input type="file" name="File2" multiple="multiple"></div>
						<div class="col-9"></div>
						<div class="col-1"><img id ="Files" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
					</div>
					<div class="col-10" id="ElencoAllegatiSupporto"></div>
				</div><br>
			
				<div class="form-group">
					<label class="col-10">Email</label>
						<div class="row">
							<div class="col-11"><input type="Email" class = "form-control" id="SupportoEmail" placeholder="email@email.dominio" name="<portlet:namespace/>SecondEmail"></div>
							<div class="col-1"><img id ="Email" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
						</div>
 				</div>
				
				<div class="form-group">
					<label class="col-10">Telefono</label>
						<div class="row">
							<div class="col-11"><input type="tel" class = "form-control" id="SupportoTel"  pattern="^[0-9-+s()]*$" title ="Attenzione: il numero di telefono può contenere solo numeri: prova a scriverlo di nuovo" name="<portlet:namespace/>SecondTelefono"></div>
							<div class="col-1"><img id ="Telefono" onClick="Help(this.id);" src="<%=request.getContextPath()%>/Media/question.png" style="width:25px;height:25px"></div>
						</div>
				</div>
								
 			</div> 
 			
 			<br><div class="col-md-10" id="Buttons">
 				<div class="g-recaptcha" data-callback="recaptchaCallback" data-sitekey="6Le02JUUAAAAABRg72K8pGC8XrvaYdTJc6x43ML2"></div><br>
 				<input type="hidden" id="captcha" value="" name="<portlet:namespace/>Captcha">
 				<div class="col-md-10">
 					<input type="checkbox" id = "Privacy" name="<portlet:namespace/>Privacy" required oninvalid="this.setCustomValidity('Attenzione: bisogna accettare la normativa sulla privacy')" oninput="setCustomValidity('')">
 					<label><a href="<%=request.getContextPath()%>/Documenti/ANPAL-Informativa-privacy-form-helpdesk-automatico.pdf"  target="_blank">Leggere la normativa sulla privacy</a></label>
 				</div><br> 
 				<div class="col-12">
 					<input  type="submit" class ="btn btn-primary" id="Button" value="Invia" style="color:white;">
 					<input  type="button" class ="btn btn-primary" id="ButtonDelete"  value="Azzera" style="color:white;">
 				</div><br>
 			</div>	
		</form>	
		
	</body>
	
	
	
      
<!--         recaptcha.frame.Main.init("[\x22finput\x22,null,[\x22conf\x22,null,\x226Le-wvkSAAAAAPBMRTvw0Q4Muexq9bi0DJwx_mJ-\x22,0,null,[\x22JS_FASTCLICK\x22,\x22JS_BFRAME\x22,\x22JS_MC_FETCH\x22,\x22JS_PT\x22]\n,0.75]\n]\n");
 -->      
    	
	<script>
		function Help(id)
		{
			switch(id)
			{
				case 'Soggetto': alert("Se stai cercando informazioni generali su ANPAL e i suoi servizi, seleziona Richiesta di informazioni " +
										   "Se hai problemi tecnici, seleziona Richiesta di supporto tecnico");
									break;
									
				case 'Oggetto': alert("Aggiungi i dettagli che ci possono aiutare nel rispondere alla tua richiesta");
								break;
				
				case 'Nome':	alert("Scrivi il tuo nome");
								break;
				
				case 'Cognome':	alert("Scrivi il tuo cognome");
								break;
				
				case 'Utente':	alert("Indicaci se sei un cittadino, un operatore o un datore di lavoro");
								break;
				
				case 'Categoria': alert("Specificare la categoria richiesta!");
								  break;
				
				case 'CF':	alert("Scrivi il tuo codice fiscale (se sei di cittadinanza) italiana altrimenti scrivi 'sconosciuto'");
							break;
				
				case 'Email': alert("Scrivi l'" + " email che possiamo usare per contattarti");
							  break;
				
				case 'Telefono': alert("Scrivi il numero di telefono che possiamo usare per contattarti");
								 break;
				
				case 'Files':	alert("Inserisci eventuali file da allegare alla tua richiesta");
								break;
				
				case 'SubCategoria':	alert("Specifica ulteriormente la tua richiesta di supporto");
										break;
				case 'ElementoCategoria':	alert("Se puoi, specifica ancora di più: ci aiuterà a risolvere più velocemente il tuo problema");
											break;
				default:	break;
			}
		}
		</script>
		 
	  <script>	  		
 				$('#RichiestaInformazioni').hide();
 				$('#RichiestaSupporto').hide();
 				$('#Buttons').hide();
 				
				$(document).on('click','#ScegliTipologia',function(e)
					{
						var x = $(this).find('option:selected').val();
				   		e.preventDefault();
				   		
				   		if(x == 'Richiesta di informazioni')
				   		{
				   			$('#RichiestaInformazioni').show();
				   			$('#Buttons').show();
				   		}
				   		else
				   		{
				   			$('#RichiestaInformazioni').hide();
				   		}
				   		
				   		if(x == 'Richiesta di supporto tecnico')
				   		{
				   			$('#RichiestaSupporto').show();
				   			$('#Buttons').show();
				   		}
				   		else
				   		{
				   			$('#RichiestaSupporto').hide();
				   		}
				   		
				   		if(x != 'Richiesta di informazioni' && x != 'Richiesta di supporto tecnico')
				   		{
				   			$('#Buttons').hide();
				   		}
					});
		</script>
	
		<script>
		$(function(){
			$('#SecondUser').on('change',function(){
				
				$('#groups').val('');
				$('#sub_groups').val('');
				$('#sub_groups_element').val('');
						
				var Utente = $('#SecondUser').find('option:selected').val();
				var sub = $('#groups');
				
				if(Utente != '')
				{  
					$('option',sub).filter(function(){
						if($(this).attr('data-group').indexOf(Utente) >= 0 || $(this).attr('data-group') === 'SHOW')
						{
							$(this).show();	
						}
						else
						{
							$(this).hide();
							$('#groups').trigger('change'); 
						}
					});	
				}
				else
				{
					$('#groups').children('option').hide();
					$('#groups').trigger('change'); 
				}
			});
			$('#SecondUser').trigger('change'); 
		});
		</script>
		
		<script>
		$(function(){
		    $('#groups').on('change', function(){
				
		    	$("#sub_groups").val('');
				$("#sub_groups_element").val('');
				$('option',"#sub_groups_element").hide();
		    	
		    	var utente = $('#SecondUser').find('option:selected').val();
		    	var val = $(this).val() + ','+utente;
		        var sub = $('#sub_groups');        
		        
		        $('option', sub).filter(function(){
					if($(this).attr('data-group') === val || $(this).attr('data-group') === 'SHOW')
			        {
						$(this).show();
			        } 
			        else
			        {
			            $(this).hide();
			        }
			    });	
		    });
		    $('#groups').trigger('change'); 
		});
		</script>
	
		<script>
			$(function(){
				$('#sub_groups').on('change',function(){
					var booleano = false;
					$('#sub_groups_element').val('');
					
					var val2 = $(this).val();  		
            		var sub2 = $('#sub_groups_element');
            		
            		$('option',sub2).filter(function(){
            			
            			if($(this).attr('data-group') === val2 || $(this).attr('data-group') === 'SHOW')
            			{
            				$(this).show();
            				if($(this).attr('data-group') === val2)
            				{
            					booleano = true;	
            				}
            			}
            			else
            			{
            				$(this).hide();
            			}
            		});
            		
            		if(booleano == true)
            		{
            			$('#sub_groups_element').prop("required",true);
            		}
            		else
            		{
            			$('#sub_groups_element').prop("required",false);
            		}
            		
            	});		
				$('#sub_groups').trigger('change');
			});
		</script>
		
		<script>
			$(function(){
				$('#Button').on('click',function(){
					var x = $('#ScegliTipologia').find('option:selected').val();	
					
					switch(x)
					{
						case 'Richiesta di informazioni':
							{
								$('#InfoNome').prop("required",true);
								$('#InfoCognome').prop("required",true);
								$('#InfoUtente').prop("required",true);
								$('#InfoCF').prop("required",true);
								$('#InfoEmail').prop("required",true);
								$('#InfoTel').prop("required",true);
								$('#InfoBody').prop("required",true);
								$('#InfoCategoria').prop("required",true);
													
								if($('#InfoCF').val().toLowerCase() === "sconosciuto")
								{
									$('#InfoCF').removeAttr('pattern');
								}
								else
								{
									$( "#InfoCF" ).prop("pattern",'^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$');
								}
								
								$('#SecondUser').prop("required",false);
								$('#groups').prop("required",false);
								$('#sub_groups').prop("required",false);
								$('#sub_groups_element').prop("required",false);
								$('#SupportoNome').prop("required",false);
								$('#SupportoCognome').prop("required",false);
								$('#SupportoCF').prop("required",false);
								$('#SupportoEmail').prop("required",false);
								$('#SupportoTel').prop("required",false);
								$('#SupportoBody').prop("required",false);
								
								break;
							}
						case 'Richiesta di supporto tecnico':
							{
								$('#SecondUser').prop("required",true);
							 	$('#groups').prop("required",true);
								$('#sub_groups').prop("required",true);
								$('#SupportoNome').prop("required",true);
								$('#SupportoCognome').prop("required",true);
								$('#SupportoCF').prop("required",true);
								$('#SupportoEmail').prop("required",true);
								$('#SupportoTel').prop("required",true);
								$('#SupportoBody').prop("required",true);
								
								if($('#SupportoCF').val().toLowerCase() === "sconosciuto")
								{
									$('#SupportoCF').removeAttr('pattern');
								}
								else
								{
									$( "#SupportoCF" ).prop("pattern",'^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$');
								}
								
								$('#InfoNome').prop("required",false);
								$('#InfoCognome').prop("required",false);
								$('#InfoUtente').prop("required",false);
								$('#InfoCF').prop("required",false);
								$('#InfoEmail').prop("required",false);
								$('#InfoTel').prop("required",false);
								$('#InfoBody').prop("required",false);
								$('#InfoCategoria').prop("required",false)
								
								break;
							}
					}
									
				});
			});
		</script>
		
		<script>
		$(function(){
			var booleano = false;
			$("input[type=file]").on('change', function(){
				
				var valore = $('#ScegliTipologia').find('option:selected').val();
				
				if(valore == 'Richiesta di informazioni')
		   		{
					$('#ElencoAllegatiInformazioni').empty();
		   		}
		   		else if(valore == 'Richiesta di supporto tecnico')
		   		{
		   			$('#ElencoAllegatiSupporto').empty();
		   		}
				
				for(var i = 0;i < $(this)[0].files.length;i++)
		    		{
		    			if($(this)[0].files[i].size == 0)
		    			{
		    				alert("Si sta provando ad inserire un file vuoto");
		    				booleano = true;
		    			}
		    			else if($(this)[0].files[i].size > 8388608)
		    			{
		    				alert("Il file o i file selezionati sono troppo grandi");
		    				booleano = true;
		    			}
		    			
		    			if($(this)[0].files[i].size != 0 && $(this)[0].files[i].size < 8388608)
		    			{
		    				var tmppath = URL.createObjectURL(event.target.files[i]);		    				
		    				var label = '<label><a href="' +tmppath +'" download>' + $(this)[0].files[i].name + '</label><br>';
		    				
		    				if($(this)[0].files.length > 1)
		    				{
		    					if(valore === 'Richiesta di informazioni')
		    					{
		    						$('#ElencoAllegatiInformazioni').append(label);
		    					}
		    					else if(valore == 'Richiesta di supporto tecnico')
		    					{
		    						$('#ElencoAllegatiSupporto').append(label);
		    					}	
		    				}
		    			}
		    		}
					
					if(booleano == true)
	    			{
	    				$(this).val('');
	    				
	    				if(valore == 'Richiesta di informazioni')
	    		   		{
	    					$('#ElencoAllegatiInformazioni').empty();
	    		   		}
	    		   		else if(valore == 'Richiesta di supporto tecnico')
	    		   		{
	    		   			$('#ElencoAllegatiSupporto').empty();
	    		   		}
	    				
	    				booleano = false;
	    			}
		    	});
		    });
		</script>
		
		<script>
			$(function(){
				$("#ButtonDelete").on('click',function(){
					$("input[type=text]").val('');
					$("input[type=file]").val('');
					$("input[type=email]").val('');
					$("input[type=tel]").val('');
					$("textarea").val('');
					
					$('select').not('#ScegliTipologia').val('');
					$('#SecondUser').trigger('change');
					$('#Privacy').prop('checked',false);
					
					/* $('#groups').trigger('change');
					$('#SecondUser').trigger('change'); 
					$('#sub_groups').trigger('change'); */
					
					$('#ElencoAllegatiInformazioni').empty();
					$('#ElencoAllegatiSupporto').empty();
					
					alert("Tutti i campi sono stati resettati");
				})
			})
		</script>
		
		<script type="text/javascript"> 
	  	function recaptchaCallback(response){ 
	  		$('#captcha').val(response);
	  	} 
		</script>
</html>
							
										
							
							