package FormOnline.portlet;

import FormOnline.constants.FormOnlinePortletKeys;

import com.liferay.mail.kernel.model.MailMessage;
import com.liferay.mail.kernel.service.MailServiceUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Arrays;

import javax.mail.AuthenticationFailedException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.net.ssl.HttpsURLConnection;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

/**
 * @author A.Filadoro
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + FormOnlinePortletKeys.FormOnline,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class FormOnlinePortlet extends MVCPortlet {
	
	private static final String fromEmail = "TestAlmaviva2502@gmail.com";
	private static final String toEmail = "a.filadoro@almaviva.it";
	private static final String url = "https://www.google.com/recaptcha/api/siteverify";
	private static final String PrivateKey = "6Le02JUUAAAAAG2XuWFms1c0ZaKfxu1v0R-6uTKL";
		
	public void sendMail(final ActionRequest request,final ActionResponse response) throws PortletException,IOException
		{	
			File[] file = null;			
			String body = null;
			String Email = null;
			String Soggetto = ParamUtil.getString(request,"Subject");
			String Captcha = ParamUtil.getString(request,"Captcha");

			switch(Soggetto) 
			{
				case "Richiesta di informazioni":
				{	
					String Nome = ParamUtil.getString(request,"Name");
					String Cognome = ParamUtil.getString(request,"Lastname");
					String CF = ParamUtil.getString(request,"CF");
					Email = ParamUtil.getString(request,"Email");
					String Telefono = ParamUtil.getString(request,"Telefono");
					String Oggetto = ParamUtil.getString(request,"Body");
					String Categoria = ParamUtil.getString(request,"Categories");
					String Utente = ParamUtil.getString(request,"Users");
					file = PortalUtil.getUploadPortletRequest(request).getFiles("File");

					body = "<i>"+Oggetto+"</i><br><br>";
					body += "<b>" +"<i>"+Nome+"</i>" + " " +"<i>"+Cognome+"</i>" +"</b><br>";
					body += "<b> Codice Fiscale </b>" + "<i>"+CF+"</i>" +"<br>";
					body += "<b> Catalogazione Richiesta: </b> " + "<i> " + Utente + " - " + Categoria + "</i><br>";					
					body +="<b>Cell: </b> "+"<i>"+Telefono+"</i>"+"<br>";
					body +="<b>e-mail: </b>"+"<i>"+Email+"</i>"+"<br>";
					break;
					
				}
				
				case "Richiesta di supporto tecnico":
				{
					String Nome = ParamUtil.getString(request,"SecondName");
					String Cognome = ParamUtil.getString(request,"SecondLastname");
					String CF = ParamUtil.getString(request,"SecondCF");
					Email = ParamUtil.getString(request,"SecondEmail");
					String Telefono = ParamUtil.getString(request,"SecondTelefono");
					String Oggetto = ParamUtil.getString(request,"SecondBody");
					String Utente = ParamUtil.getString(request,"SecondUser");
					String Categoria = ParamUtil.getString(request,"SecondCategories");
					String SubCategoria = ParamUtil.getString(request,"SubCategories");
					String ElementoCategoria = ParamUtil.getString(request,"Element");
					file = PortalUtil.getUploadPortletRequest(request).getFiles("File2");
					
					if(ElementoCategoria.equals("0"))
						ElementoCategoria ="";
					
					body = "<i>"+Oggetto+"</i><br><br>";
					body += "<b>" + Nome + " " + Cognome +"</b><br>";
					body += "<b> Codice Fiscale </b>" + "<i>"+CF+"</i>" +"<br>";
					body += "<b> Catalogazione Richiesta: </b> " + "<i> " + Utente + " - " + Categoria + " - " + SubCategoria + " - " + ElementoCategoria + "</i><br>";					
					body +="<b>Cell: </b> "+"<i>"+Telefono+"</i>"+"<br>";
					body +="<b>e-mail: </b>"+ "<i>"+Email+"</i>"+"<br>";
					break;
				}
				
				default: break;
			}
					
			MailMessage Messaggio = new MailMessage();
			MailMessage MessaggioUtente = new MailMessage();
			
			try
			{				
				Messaggio.setSubject(Soggetto);
				Messaggio.setHTMLFormat(true);
				Messaggio.setBody(body);
				Messaggio.setFrom(new InternetAddress(fromEmail));
				Messaggio.setTo(new InternetAddress(toEmail));
				
				MessaggioUtente.setSubject("Non rispondere - " + Soggetto);
				MessaggioUtente.setHTMLFormat(true);
				MessaggioUtente.setBody(body);
				MessaggioUtente.setFrom(new InternetAddress(fromEmail));
				MessaggioUtente.setTo(new InternetAddress(Email));

				if(!Arrays.asList(file).isEmpty())
				{
					for(File f:file)
					{
						Messaggio.addFileAttachment(f);
						MessaggioUtente.addFileAttachment(f);
					}
				}
				
				if(VerifyCaptcha(Captcha)) // SE IL CAPTCHA E' VERIFICATO ALLORA SI PROVVEDE AD INVIARE L'EMAIL
				{
					MailServiceUtil.sendEmail(Messaggio);
					MailServiceUtil.sendEmail(MessaggioUtente);
					SessionMessages.add(request,"success");
				}
				else
				{
					SessionErrors.add(request,"error");
				}
			}
			catch(AddressException e)
			{
				System.err.println(e.getMessage());
				SessionErrors.add(request,"error");
			}
			catch(Exception e)
			{
				System.err.println(e.getMessage());				
				SessionErrors.add(request,"error");
			}
		}
	
	/*LA FUNZIONE EFFETTUA UN CONTROLLO SULLA VERIFICA DEL CAPTCHA.. VIENE PASSATO LA STRINGA RESPONSE CHE CORRISPONDE ALL' ID g-response-captcha LATO CLIENT 
	 * SULLA BASE DI QUESTA STRINGA E DELLA PRIVATE KEY DEL CAPTCHA VIENE EFFETTUATA UNA CHIAMATA POST AL SITO 'https://www.google.com/recaptcha/api/siteverify'
	 * E VIENE RESTITUITA LA RISPOSTA
	 */
	public boolean VerifyCaptcha(String response)
	{
		try
		{
			HttpsURLConnection con = (HttpsURLConnection) new URL(url).openConnection();

			// add reuqest header
			con.setRequestMethod("POST");
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

			String postParams = "secret=" + PrivateKey + "&response=" + response;

			// Send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer Response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) 
			{
				Response.append(inputLine);
			}
			in.close();
	
			// print result
			System.out.println("\n" + "Response from URL " + url + " = " +Response.toString() +"\n");
			
			if(Response.toString().contains("true"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception e)
		{
			System.err.println(e.getMessage());
			return false;
		}
	}
}